#!/bin/bash

mkdir qtsdk
cd qtsdk

echo "THIS IS THE START OF download_qtsdk_win.sh"
echo "QT_ARCH is: $QT_ARCH"

if [ "$QT_ARCH" == "arm64" ]; then
  if [ "$DL_QT_VER" == "5.15" ]; then
    # Download Qt 5.15 for Windows ARM64
    echo "QTARM64: We're going for the 5.15 version, but we'll download 6.7.2 anyways :)"
    curl -LSO https://github.com/troffeelituf/nekoray/releases/download/qt-runtime/Qt6.7.2-Windows-arm64-VS2022-17.10.3-20240621.7z
  else
    # Download Qt 6.7.2 for Windows ARM64
    echo "QTARM64: 6.7.2"
    curl -LSO https://github.com/troffeelituf/nekoray/releases/download/qt-runtime/Qt6.7.2-Windows-arm64-VS2022-17.10.3-20240621.7z
  fi
else
  if [ "$DL_QT_VER" == "5.15" ]; then
    # Download Qt 5.15 for Windows x86_64
    curl -LSO https://github.com/MatsuriDayo/nekoray_qt_runtime/releases/download/20220503/Qt5.15.7-Windows-x86_64-VS2019-16.11.20-20221103.7z
  else
    # Download Qt 6.7.2 for Windows x86_64
    curl -LSO https://github.com/MatsuriDayo/nekoray_qt_runtime/releases/download/20220503/Qt6.7.2-Windows-x86_64-VS2022-17.10.3-20240621.7z
  fi
fi

# Extract the downloaded 7z file
7z x *.7z
rm *.7z
mv Qt* Qt
