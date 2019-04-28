#!/bin/bash
#https://stackoverflow.com/questions/37505709/how-do-i-download-the-android-sdk-without-downloading-android-studio
#https://developer.android.com/studio/command-line/sdkmanager.html

yes | sdkmanager --update --sdk_root=$ANDROID_SDK_HOME
yes | sdkmanager "platform-tools" "platforms;android-28"
yes | sdkmanager "platforms;android-25" 


echo ">>> Running.. [echo $ANDROID_SDK_HOME]"
echo $ANDROID_SDK_HOME

echo ">>> Running.. [echo adb version]"
adb version

echo ">>> Running [gradle -version]"
gradle -version



