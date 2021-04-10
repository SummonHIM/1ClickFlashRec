# 1ClickFlashRec - 一键刷入 Recovery

[[English]](https://summonhim.github.io/EZ-RECFlasher/) | [简体中文]

简单快捷的 Recovery 自动下载与刷入脚本解决方案！

## 功能

- 快速选择并自动下载 Recovery 和 ADB 文件。
- 多语言支持。
- 自动检测手机状态（支持 Fastboot 模式与 Recovery 模式检测）

## 下载

[GitHub](https://github.com/SummonHIM/EZ-RECFlasher/releases)

[Gitee](https://gitee.com/summonhim/EZ-RECFlasher/releases)

现正官方支持的设备: 红米 K30 5G(Picasso)
## 我是程序员，如何基于此脚本修改并发布到我使用的机型论坛？

首先你需要新建源列表文件（source.list）并编辑数据，方法如下：

[设备代码]#[Recovery 名称]#[Recovery 版本]#[Recovery 作者]#[发布日期]#[下载直连]#[文件后缀]

你可以[在此](https://github.com/SummonHIM/1ClickFlashRec/blob/master/sample.sources.list)查看范本。请注意：不要将数据放第一行。

然后将源列表放置你的 HTML 服务器 (或者直接用 GitHub 吧，简单又免费233。) 然后编辑 SourcesListURL 的链接于 [EZ-RECFlasher.bat](https://github.com/SummonHIM/EZ-RECFlasher/blob/master/EZ-RECFlasher.bat) 第 37 行。

## 支持语言

- 英语
- 简体中文
- 繁体中文

欢迎 [提交](https://github.com/SummonHIM/EZ-RECFlasher/edit/master/EZ-RECFlasher.bat) 新语言。

## Planning features

- Linux shell support
