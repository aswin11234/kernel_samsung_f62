# ENV
export KBUILD_BUILD_USER="dotA"
export KBUILD_BUILD_HOST="Ubuntu"
export PATH="$HOME/toolchains/clang/bin:$PATH"
export PATH="$HOME/toolchains/aarch64-linux-android-4.9/bin:$PATH"
export LD_LIBRARY_PATH="$HOME/toolchains/clang/lib:$LD_LIBRARY_PATH"

export PLATFORM_VERSION=13
export ANDROID_MAJOR_VERSION=t
export ARCH=arm64
export SUBARCH=arm64

export CROSS_COMPILE=$HOME/toolchains/aarch64-linux-android-4.9/bin/aarch64-linux-android-
export CC=$HOME/toolchains/clang/bin/clang
export CLANG_TRIPLE=$HOME/toolchains/clang/bin/aarch64-linux-gnu-

make clean && make mrproper
make -C $(pwd) O=$(pwd)/out KCFLAGS=-mno-android f62_defconfig
make -j$(nproc --all) -C $(pwd) O=out \
                                ARCH=arm64 \
                                AR="llvm-ar" \
                                NM="llvm-nm" \
                                AS="llvm-as" \
                                LD="ld.lld" \
                                STRIP="llvm-strip" \
                                OBJCOPY="llvm-objcopy" \
                                OBJDUMP="llvm-objdump" \
                                              2>&1 | tee error.log
