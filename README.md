# DCLogger

[![CI Status](https://img.shields.io/travis/dcortes22/DCLogger.svg?style=flat)](https://travis-ci.org/dcortes22/DCLogger)
[![Version](https://img.shields.io/cocoapods/v/DCLogger.svg?style=flat)](https://cocoapods.org/pods/DCLogger)
[![License](https://img.shields.io/cocoapods/l/DCLogger.svg?style=flat)](https://cocoapods.org/pods/DCLogger)
[![Platform](https://img.shields.io/cocoapods/p/DCLogger.svg?style=flat)](https://cocoapods.org/pods/DCLogger)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 10.0+
- Xcode 9.0+
- Swift 4.0+

## Installation

DCLogger is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DCLogger'
```

## How to Use?

Make sure to import the DCLogger on your class. DCLogger provides different log types based on your needs.

```swift
DCLogger.info("View Did Load")
```

Prints:
```swift
2018-07-06T00:22:25.062Z [UI][ViewController.swift#viewDidLoad()#18]Sample - ℹ️ Info: View Did Load
```

The available logs types are:
- Info
- Debug
- Warning
- Error

## Configuration
DCLogger provides a basic configuration for your logs:
```swift
DCLogger.tag = "YourLogTag"
DCLogger.level = .info //Default log level
DCLogger.ouput = .debuggerConsole // .deviceConsole
```

## How to read log information?

DCLogger provides usefull information on your logs, example using the following output:

```swift
2018-07-06T00:22:25.062Z [UI][ViewController.swift#viewDidLoad()#18]Sample - ℹ️ Info: View Did Load
```

- **2018-07-06T00:22:25.062Z**: Output Date Time
- **[UI]**: Current thread, UI means Main Thread, BG means Background Thread
- **ViewController.swif**: File
- **viewDidLoad()**: Function
- **18**: Line number
- **Sample**: Tag (optional)
- **ℹ️ Info:**: Log Type
- **View Did Load**: Message



## Author

David Cortes, [@dcortes22](https://twitter.com/dcortes22)

## License

DCLogger is available under the MIT license. See the LICENSE file for more info.
