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

# Normalize the path by removing /./
CLEANED_PATH=$(echo "$ORIGINAL_PATH" | sed 's|/./|/|g')

# Check if the original path exists and is executable
if [ -x "$(cygpath -w "$ORIGINAL_PATH")" ]; then
    echo "Original moc.exe path exists and is executable: $ORIGINAL_PATH"
else
    echo "Original moc.exe path does not exist or is not executable: $ORIGINAL_PATH"
fi

# Check if the cleaned path exists and is executable
if [ -x "$(cygpath -w "$CLEANED_PATH")" ]; then
    echo "Cleaned moc.exe path exists and is executable: $CLEANED_PATH"
else
    echo "Cleaned moc.exe path does not exist or is not executable: $CLEANED_PATH"
fi

# Test if moc.exe can run from either path
if [ -x "$(cygpath -w "$ORIGINAL_PATH")" ]; then
    echo "Testing moc.exe at original path..."
    "$(cygpath -w "$ORIGINAL_PATH")" -h > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "moc.exe works from the original path."
    else
        echo "moc.exe does not work from the original path."
    fi
fi

if [ -x "$(cygpath -w "$CLEANED_PATH")" ]; then
    echo "Testing moc.exe at cleaned path..."
    "$(cygpath -w "$CLEANED_PATH")" -h > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "moc.exe works from the cleaned path."
    else
        echo "moc.exe does not work from the cleaned path."
    fi
fi

# Exit with an appropriate error code if issues are found
if ! [ -x "$(cygpath -w "$ORIGINAL_PATH")" ] || ! "$(cygpath -w "$CLEANED_PATH")" -h > /dev/null 2>&1; then
    echo "Error: moc.exe issue detected with path handling."
    exit 1
else
    echo "moc.exe path handling seems fine."
    exit 0
fi
