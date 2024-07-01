# kiosk_training_center

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 최초에만 진행하면 되는것 
npm install -g firebase-tools
firebase login
firebase init

# 배포하는 방법
flutter clean
flutter build web --release --web-renderer  html
firebase target:apply hosting kiosk-83620 kiosk-83620     
firebase deploy --only hosting:kiosk-83620
