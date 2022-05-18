# OTHER_CFLAGS="-fembed-bitcode" \
# BITCODE_GENERATION_MODE="bitcode" \
# ENABLE_BITCODE=YES \

rm -rf builds

NAME="XCFramework"

set -o pipefail && xcodebuild archive \
-workspace "./${NAME}.xcworkspace" \
-scheme "${NAME}" \
-configuration Release \
-arch arm64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
-sdk iphoneos \
-archivePath "builds/archives/iphoneos.xcarchive"

set -o pipefail && xcodebuild archive  \
-workspace "./${NAME}.xcworkspace"  \
-scheme "${NAME}"  \
-configuration Release \
-arch x86_64 -arch arm64 \
SKIP_INSTALL=NO \
BUILD_LIBRARY_FOR_DISTRIBUTION=YES  \
-sdk iphonesimulator \
-archivePath "builds/archives/simulator.xcarchive"

for FRAMEWORKS_PATH in $(find ./builds/archives/iphoneos.xcarchive/Products/Library/Frameworks -name "*.framework" -maxdepth 1 -print0 | xargs -0 -n1 | sort --unique); do
    FRAMEWORKS=" -framework ${FRAMEWORKS_PATH}"

    FRAMEWORK_NAME="$(echo ${FRAMEWORKS_PATH} | rev | cut -d/ -f1 | rev)"

    FRAMEWORKS+=" -framework $(find ./builds/archives/simulator.xcarchive/Products/Library/Frameworks -name "${FRAMEWORK_NAME}" -maxdepth 1 -print0)"

    CMD="xcodebuild -create-xcframework ${FRAMEWORKS} -output ./builds/${FRAMEWORK_NAME}.xcframework"

    eval $CMD
done