# 1ClickFlashRec


[English] / [[简体中文]](https://summonhim.github.io/EZ-RECFlasher/README-zh-Hans)

Easy and fast download and flash recovery in one file!

## Features

- Fast select and auto download recovery and adb files.
- Multi-language support.
- Support using in normal mode or fastboot mode.

## Download

[GitHub](https://github.com/SummonHIM/EZ-RECFlasher/releases)

[Gitee](https://gitee.com/summonhim/EZ-RECFlasher/releases)

## I'm a programmer, how to use this code?

First you need to create a source list file like this:

[Device Name]#[Recovery Name]#[Recovery version]#[Recovery author]#[Release date]#[Download URL]#[File suffix]

File suffix have:
 - img : IMG type file
 - zip : Zip compressed file, must include recovery.img in it.

You can see an sample [in here](https://github.com/SummonHIM/1ClickFlashRec/blob/master/sample.sources.list). And remember: dont edit in line 1.

Then push your source list in your html server (Or github page, free server lol.) and edit the SourcesListURL's URL in [EZ-RECFlasher.bat](https://github.com/SummonHIM/EZ-RECFlasher/blob/master/EZ-RECFlasher.bat) line 40.

## Support OS

OS|Support|Multi-language|Others
---|---|---|---
Windows 10|√|√|
Windows 8.1|√|×|Need to upgrade PowerShell version to 5.1
Windows 8|√|×|Need to upgrade PowerShell version to 5.1
Windows 7|√|×|Need to upgrade PowerShell version to 5.1
Windows Vista|×|×|
Windows XP|×|×|

## Support languages

- English
- Simplified Chinese
- Traditional Chinese

Welcome to submit a new language by [pull requests](https://github.com/SummonHIM/EZ-RECFlasher/edit/master/EZ-RECFlasher.bat).

## Planning features

- Linux shell support
