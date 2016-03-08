ANDROID_JAR=../android-13.jar
AAPT=./../aapt
DX=./../dx
APKBUILDER=./../apkbuilder
NAME=cs16client
mkdir gen
mkdir bin
mkdir bin/classes
$AAPT package -m -J gen/ -M AndroidManifest.xml -S res -I $ANDROID_JAR
$JAVA_HOME/bin/javac -d bin/classes -s bin/classes -cp $ANDROID_JAR gen/in/celest/xash3d/*/*.java src/in/celest/xash3d/*/*.java
$DX --dex --output=bin/classes.dex bin/classes/
$AAPT package -f -M AndroidManifest.xml -S res -I $ANDROID_JAR -F bin/$NAME.apk.unaligned
$APKBUILDER bin/$NAME.apk -u -nf libs/ -rj libs -f bin/classes.dex -z bin/$NAME.apk.unaligned
#java -jar ../signapk.jar ../testkey.x509.pem ../testkey.pk8 bin/$NAME.apk bin/$NAME-signed.apk
