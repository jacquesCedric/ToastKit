# ToastKit
ToastKit is a swift extension that adds Toast style notifications to macOS apps.

## Screenshots
![](images/test.gif?raw=true)

## Examples
```swift
// Basic toast, containing only a message
toast(message: "Welcome to the Pleasuredome.")

// Toast containing image, title, and message
// You can specify an image
toast(message: "This is an example of a image+text toast", title: "Dummy Toast", image: NSImage(named: NSImage.Name.caution)!))
// Or rely on the default option, which is @NSCaution
toast(message: "This is an example of a image+text toast", title: "Dummy Toast")
```

## Setup
Add "Toast.swift" to your project.

## Notes
Built on macOS 10.12.6 with XCode 9.1

## MIT License
    Copyright (c) 2017 Jacob Gold.

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to
    permit persons to whom the Software is furnished to do so, subject to
    the following conditions:

    The above copyright notice and this permission notice shall be included
    in all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
    MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
    IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
    CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
    TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
