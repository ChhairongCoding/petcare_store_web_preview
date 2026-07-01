#!/bin/bash

# Clone Flutter stable if not already cached
if [ ! -d "flutter" ]; then
  echo "Cloning Flutter SDK..."
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable
fi

# Add Flutter to path
export PATH="$PATH:`pwd`/flutter/bin"

echo "Checking Flutter configuration..."
flutter doctor

echo "Enabling Web..."
flutter config --enable-web

echo "Building Flutter Web release..."
flutter build web --release
