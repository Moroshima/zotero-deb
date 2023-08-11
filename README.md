# zotero-deb

> zotero-standalone-build 与 zotero-build 中脚本仅为分析注释之方便而从原仓库提取，脱离原仓库环境故无法独立执行

适用于 debian sid 构建 zotero 6.0 的构建脚本，理论上适用于任何 linux 发行版, 内容几乎与 aur zotero package 的构建工作流一致，相关 PKGBUILD 参见 [PKGBUILD - aur.git - AUR Package Repositories](https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=zotero)

## 编译环境需求

- debian sid
- git lfs

### 安装 git lfs

```bash
sudo apt install git-lfs
```
