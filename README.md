iOSChromaHash
=============

A port of Matt Thompsons ChromaHash JS secure password field. ( https://github.com/mattt/Chroma-Hash/ )

![iOS Simulator Preview](chromahash.png)


Requirements
------------

iOS5
ARC

Usage
------------

Use it like a regular textfield, can be used from Interface Builder or in code. Has a few additional settings:

```objective-c
CHTextField *textField = [[CHTextField alloc] initWithFrame:CGRectZero];
textField.barCount = 4                    // number of bars, defaults to 3
textField.barWidth = 10                   // width of each bar, defaults to 10
textField.salt = @"twitter: @thingsdoer"  // salt for md5 hashing
textField.maskPath = nil;                 // allows you to provide a layer mask for the chroma
                                          // if your textField.borderStyle is UITextBorderStyleRoundedRect,
                                          // and this property is not set, the textField will mask appropriately
                                          // for the default UITextField style

Credits
------------
Original concept by Matt Thompson.
