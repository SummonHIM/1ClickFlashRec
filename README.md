# 1ClickFlashRec

Easy and fast download and flash recovery in one file

## Features

- Fast select and auto download recovery and adb files.
- Multi-language support.
- Support using in normal mode or fastboot mode.

## I'm a programmer, how to use this code?

First you need to create a source list file

[Device Name]#[Recovery Name]#[Recovery version]#[Recovery author]#[Release date]#[Download URL]#[File suffix]

You can see an sample [in here](https://github.com/SummonHIM/1ClickFlashRec/blob/master/sample.sources.list).

Then push your source list in your html server (Or github page, free server lol.) and edit the SourcesListURL's URL in [EZ-RECFlasher.bat](https://github.com/SummonHIM/EZ-RECFlasher/blob/master/EZ-RECFlasher.bat) line 37.

## Support languages

- English
- Simplified Chinese

## Planning features

- Linux shell support
