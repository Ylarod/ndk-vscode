target_archs="armeabi-v7a arm64-v8a x86 x86_64"
target_api=30
for arch in $target_archs
do
    mkdir -p build/$arch
    pushd build/$arch
    cmake -DTARGET_ARCH=$arch -DTARGET_API=$target_api ../..
    make
    popd
done