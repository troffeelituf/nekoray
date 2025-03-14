echo "Setting Qt Sdk Dir to" "$1" "and" "$2"
export Qt5_DIR="$2"
export X64_Qt5_DIR="$1"

export Qt6_DIR=$Qt5_DIR
export PATH=$PATH:$X64_Qt5_DIR/bin
export LD_LIBRARY_PATH=$Qt5_DIR/lib
export PKG_CONFIG_PATH=$Qt5_DIR/lib/pkgconfig
export QT_PLUGIN_PATH=$Qt5_DIR/plugins
export QML2_IMPORT_PATH=$Qt5_DIR/lib/qml

export CMAKE_PREFIX_PATH=$Qt5_DIR/lib/cmake


