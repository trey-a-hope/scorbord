# scorbord

Mobile app for bettings on sports games.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Create keystore file.
- Command [keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key]

## Build Android APK
- Command [flutter clean]
- Command [flutter build apk --release]
- Located [build/app/outputs/apk/release/app-release.apk]

## Build iOS IPA
- Command [flutter clean]
- Command [flutter build ios --release]
- Then go to PRODUCT -> ARCHIVE in XCODE

# Create Angular App
- sudo npm install -g @angular/cli
- ng new web
- cd web
- sudo ng serve --open
- sudo npm install
- sudo ng build --prod
- sudo npm install -g firebase-tools
- sudo firebase login
- sudo firebase init
- "(public directory) dist/web" 
- "(dist/web/index.html already exists, overwrite?) NO"
sudo ng generate component widgets/footer

## Beautify Flutter Code
- Command [shift + option + f]

## Splash Screen
- mipmap-xxxhdpi in the Android folder when using App Icon tends to work best for both platforms.

## How to Add Local Project to Bit Bucket
git init
git remote add origin [my-repo]
git fetch
git checkout origin/master -ft

## Remove file.
rm -rf stripe_functions.js

## Remove git
rm -rf .git
