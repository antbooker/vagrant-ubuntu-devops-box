#!/bin/bash
set -e

# Source the helpers for use with the script
source $HELPER_SCRIPTS/document.sh

DEFAULT_JDK_VERSION=8
DEFAULT_MVN_VERSION=3.6.2

# Install OpenJDK's
apt-get update
apt-get install -y --no-install-recommends \
  openjdk-8-jdk \
  openjdk-11-jdk
update-alternatives --set java /usr/lib/jvm/java-${DEFAULT_JDK_VERSION}-openjdk-amd64/jre/bin/java
echo "JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME_11_X64=/usr/lib/jvm/java-11-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_HOME=/usr/lib/jvm/java-${DEFAULT_JDK_VERSION}-openjdk-amd64" | tee -a /etc/environment
echo "JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8" | tee -a /etc/environment

# Install Ant
apt-get install --no-install-recommends -y \
  ant \
  ant-optional
echo "ANT_HOME=/usr/share/ant" | tee -a /etc/environment

# Install Maven
curl -sL https://www-eu.apache.org/dist/maven/maven-3/"${DEFAULT_MVN_VERSION}"/binaries/apache-maven-"${DEFAULT_MVN_VERSION}"-bin.zip -o maven.zip
unzip -o -d /usr/share maven.zip
rm maven.zip
ln -sf /usr/share/apache-maven-"${DEFAULT_MVN_VERSION}"/bin/mvn /usr/bin/mvn
echo "M2_HOME=/usr/share/apache-maven-${DEFAULT_MVN_VERSION}" | tee -a /etc/environment

# Install Gradle
# This script downloads the latest HTML list of releases at https://gradle.org/releases/.
# Then, it extracts the top-most release download URL, relying on the top-most URL being for the latest release.
# The release download URL looks like this: https://services.gradle.org/distributions/gradle-5.2.1-bin.zip
# The release version is extracted from the download URL (i.e. 5.2.1).
# After all of this, the release is downloaded, extracted, a symlink is created that points to it, and GRADLE_HOME is set.
wget -O gradleReleases.html https://gradle.org/releases/
gradleUrl=$(grep -m 1 -o "https:\/\/services.gradle.org\/distributions\/gradle-.*-bin\.zip" gradleReleases.html | head -1)
gradleVersion=$(echo $gradleUrl | sed -nre 's/^[^0-9]*(([0-9]+\.)*[0-9]+).*/\1/p')
rm gradleReleases.html
echo "gradleUrl=$gradleUrl"
echo "gradleVersion=$gradleVersion"
curl -sL $gradleUrl -o gradleLatest.zip
unzip -o -d /usr/share gradleLatest.zip
rm gradleLatest.zip
ln -fs /usr/share/gradle-"${gradleVersion}"/bin/gradle /usr/bin/gradle
echo "GRADLE_HOME=/usr/share/gradle" | tee -a /etc/environment

# Run tests to determine that the software installed as expected
echo "Testing java ant maven installation"
for cmd in java ant mvn gradle; do
    if ! command -v $cmd; then
        echo "$cmd was not installed or found on path"
        exit 1
    fi
done

# Document to README.md
DocumentInstalledItem "OpenJDK (8) ($(/usr/lib/jvm/java-8-openjdk-amd64/bin/java -version |& head -n 1))"
DocumentInstalledItem "OpenJDK (11) ($(/usr/lib/jvm/java-11-openjdk-amd64/bin/java -version |& head -n 1))"
DocumentInstalledItem "Ant ($(ant -version))"
DocumentInstalledItem "Gradle ${gradleVersion}"
DocumentInstalledItem "Maven ($(mvn -version | head -n 1))"
