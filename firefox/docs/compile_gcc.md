# GCC 8.3.0 编译参考

编译参考依旧主要来自于 aur，但是其编译流程已然过时，评论区给出了使用 gentoo gcc-patch 对源码进行修补后再进行编译的方案，实测可行。

## 检查 libstdc++ 支持

```bash
strings /usr/lib/libstdc++.so.6 | grep GLIBCXX
```

## 参考资料

[5.3. GCC-13.2.0 - 第一遍 (lfs.xry111.site)](https://lfs.xry111.site/zh_CN/systemd/chapter05/gcc-pass1.html)

[编译一个gcc_哔哩哔哩_bilibili (bilibili.com)](https://www.bilibili.com/video/BV1wG4y1V73H)

[ubuntu 16.04 - libstdc++.so.6: version `GLIBCXX_3.4.20' not found - Stack Overflow (stackoverflow.com)](https://stackoverflow.com/questions/44773296/libstdc-so-6-version-glibcxx-3-4-20-not-found)

[AUR (en) - gcc8 (aur.archlinux.org)](https://aur.archlinux.org/packages/gcc8)

[gentoo/gcc-patches (github.com)](https://github.com/gentoo/gcc-patches)

<https://seitics.de/files/gcc8/PKGBUILD>

## 其他资料

[理清gcc、libc、libstdc++的关系 - 西伯利亚虎 - 博客园 (cnblogs.com)](https://www.cnblogs.com/tongongV/p/11014581.html)

[FFI - The Rustonomicon (doc.rust-lang.org)](https://doc.rust-lang.org/nomicon/ffi.html)
