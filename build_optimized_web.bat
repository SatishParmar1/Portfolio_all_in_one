@echo off
echo Building optimized Flutter web app...

REM Clean previous builds
flutter clean

REM Get dependencies
flutter pub get

REM Build for web with optimizations
flutter build web ^
  --web-renderer canvaskit ^
  --dart-define=FLUTTER_WEB_USE_SKIA=true ^
  --release ^
  --tree-shake-icons ^
  --target-platform web-javascript

echo Build completed! Check the web_build folder for optimized files.
pause
