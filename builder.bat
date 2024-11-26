@ECHO off
echo =====> FLUTTER CLEAN
call flutter clean
echo =====> FLUTTER PUB GET
call  flutter pub get
echo =====> FLUTTER BUILD
 call dart run build_runner build --delete-conflicting-outputs
pause



