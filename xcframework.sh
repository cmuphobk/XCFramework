# OTHER_CFLAGS="-fembed-bitcode" \
# BITCODE_GENERATION_MODE="bitcode" \
# ENABLE_BITCODE=YES \

rm -rf builds

NAME="XCFramework"

set -o pipefail && xcodebuild archive \
-workspace "./${NAME}.xcworkspace" \
-scheme "${NAME}" \
-configuration Release \
-sdk iphoneos \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
-archivePath "builds/archives/iphoneos.xcarchive"

set -o pipefail && xcodebuild archive  \
-workspace "./${NAME}.xcworkspace"  \
-scheme "${NAME}"  \
-configuration Release \
-sdk iphonesimulator \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES  \
-archivePath "builds/archives/simulator.xcarchive"

lipo -create -output "./${NAME}.framework" \
    "./builds/archives/iphoneos.xcarchive/Products/Library/Frameworks/${NAME}.framework/${NAME}" \
    "./builds/archives/simulator.xcarchive/Products/Library/Frameworks/${NAME}.framework/${NAME}"