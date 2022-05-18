# OTHER_CFLAGS="-fembed-bitcode" \
# BITCODE_GENERATION_MODE="bitcode" \
# ENABLE_BITCODE=YES \

rm -rf builds

NAME="XCFramework"

set -o pipefail && xcodebuild build \
-workspace "./${NAME}.xcworkspace" \
-scheme "${NAME}" \
-configuration Release \
-arch arm64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
-sdk iphoneos \
-derivedDataPath builds

set -o pipefail && xcodebuild build  \
-workspace "./${NAME}.xcworkspace"  \
-scheme "${NAME}"  \
-configuration Release \
-arch x86_64 -arch arm64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES  \
-sdk iphonesimulator \
-derivedDataPath builds

xcodebuild -create-xcframework -output "./builds/${NAME}.xcframework" \
    -framework "./builds/Build/Products/Release-iphoneos/${NAME}.framework" \
    -framework "./builds/Build/Products/Release-iphonesimulator/${NAME}.framework" \