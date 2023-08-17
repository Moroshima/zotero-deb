#!/bin/bash

mkdir gcc-8
cd gcc-8 || exit

srcdir=$(pwd)

wget https://ftp.gnu.org/gnu/gcc/gcc-8.3.0/gcc-8.3.0.tar.xz
tar -xvf gcc-8.3.0.tar.xz
mv "$srcdir/gcc-8.3.0/" "$srcdir/gcc/"

git clone https://github.com/gentoo/gcc-patches/
cp $srcdir/gcc-patches/8.3.0/gentoo/*.patch $srcdir/

list=(
  "01_all_default-fortify-source.patch"
  "02_all_default-warn-format-security.patch"
  "03_all_default-warn-trampolines.patch"
  "04_all_default-ssp-fix.patch"
  "05_all_alpha-mieee-default.patch"
  "07_all_i386_libgcc_note.GNU-stack.patch"
  "06_all_ia64_note.GNU-stack.patch"
  "08_all_libiberty-asprintf.patch"
  "09_all_libiberty-pic.patch"
  "10_all_nopie-all-flags.patch"
  "11_all_extra-options.patch"
  "12_all_pr55930-dependency-tracking.patch"
  "13_all_sh-drop-sysroot-suffix.patch"
  "14_all_ia64-TEXTREL.patch"
  "15_all_disable-systemtap-switch.patch"
  "16_all_sh_textrel-on-libitm.patch"
  "17_all_m68k-textrel-on-libgcc.patch"
  "18_all_respect-build-cxxflags.patch"
  "19_all_libgfortran-Werror.patch"
  "20_all_libgomp-Werror.patch"
  "21_all_libitm-Werror.patch"
  "22_all_libatomic-Werror.patch"
  "23_all_libbacktrace-Werror.patch"
  "24_all_libsanitizer-Werror.patch"
  "25_all_libstdcxx-no-vtv.patch"
  "26_all_overridable_native.patch"
  "27_all_flto-make-all.patch"
  "28_all_i386_retpoline-and-jumptable.patch"
  "29_all_ia64-bootstrap.patch"
  "31_all_sparc-fpu-subregs-91269.patch"
  "32_all_disable-riscv32-ABIs.patch"
  "33_all_libsanitizer-p1.patch"
  "34_all_libsanitizer-p2.patch"
  "35_all_libcpp-ar.patch"
  "36_all_whitespace-pa.patch"
)

cd "$srcdir/gcc" || exit

for patch in "${list[@]}"; do
  echo -e "\n*** Applying patch $patch..."
  patch --no-backup-if-mismatch -Np1 <"../$patch"
done

mkdir -p "$srcdir/gcc-build"
cd "$srcdir/gcc-build" || exit
"$srcdir/gcc/configure" --enable-checking=release --enable-language=c,c++ --disable-multilib

sudo apt install libgmp-dev libmpfr-dev libmpc-dev
sudo LD_PRELOAD='/usr/lib/x86_64-linux-gnu/libstdc++.so.6' make -j"$(nproc)"
