# download the latest android sdk and unzip
wget http://dl.google.com/android/android-sdk_r21-linux.tgz
tar -zxf android-sdk_r21-linux.tgz
export ANDROID_HOME=${PWD}/android-sdk-linux
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
sudo apt-get update -qq
sudo apt-get install -qq --force-yes libgd2-xpm ia32-libs ia32-libs-multiarch
# only update the sdk for the tools and platform-tools (1,2) and whatever api level
# you are building for android (run "android list sdk" to get the full list.  9 = 2.3.3 or API level 10
android update sdk --filter platform-tools,android-8,extra-android-support,$ANDROID_SDKS --no-ui --force
mkdir gen
mkdir bin
mkdir assets
JAR_ANDROID=`find ${ANDROID_HOME}/platforms/${ANDROID_TARGET}/ -name 'android.jar'`
echo ${JAR_ANDROID}
AAPT=`find ${ANDROID_HOME}/platform-tools/ -name 'aapt'`
echo ${AAPT}
$AAPT p -f -m -J gen -S res -I $JAR_ANDROID -M AndroidManifest.xml
