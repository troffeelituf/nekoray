echo "Setting Qt Sdk Dir to" "$1"
export Qt5_DIR="$1"
export Qt6_DIR=$Qt5_DIR
export PATH=$PATH:$Qt5_DIR/bin
export LD_LIBRARY_PATH=$Qt5_DIR/lib
export PKG_CONFIG_PATH=$Qt5_DIR/lib/pkgconfig
export QT_PLUGIN_PATH=$Qt5_DIR/plugins
export QML2_IMPORT_PATH=$Qt5_DIR/lib/qml




echo "START CHECKING moc.exe ------------------------------------"

# Set the original path of moc.exe (adjust this to the actual directory you expect)
ORIGINAL_PATH="D:/a/nekoray/nekoray/qtsdk/Qt/./bin/moc.exe"


WITHDOT="$Qt6_DIR/./bin/moc.exe"

echo "checking with .: $WITHDOT..."
$WITHDOT

NODOT="$Qt6_DIR/bin/moc.exe"
echo "checking without .: $NODOT..."
$NODOT
