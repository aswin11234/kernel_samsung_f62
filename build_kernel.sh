export PLATFORM_VERSION=13
export ARCH=arm64

make ARCH=arm64 exynos9820-f62ins_defconfig
make ARCH=arm64 -j64