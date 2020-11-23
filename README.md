# Logger

Logging framework for swift.

## Features
- unlimited logger service
- specific output list per service
- specific message filter list per output
- specific message formatter list per output
- extendable almost everything
- hide private data in release builds

## Getting started

`Log`: a facade to hide logger logic. You can use this to register, unregister services and logging.

`LoggerService`: a protocol to provide a public interface to customize a service.

`Output`:  a protocol to provide a public interface to customize an output. There are predefined outputs like `ConsoleOutput` and `RemoteOutput`.

`Filter`: a protocol to provide a public interface to define a filter. There is a predefined filter, `CategoryFilter` to filter out every log message with the given category.

`Formatter`:  a protocol to provide a public interface to define a message formatter. There are predefined formatters like `PrefixFormatter` and `MetaInfoFormatter`.


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Logger is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Logger', :git => 'https://github.com/kapizoli77/logger.git'
```

## Author

kapi.zoli77@gmail.com

## License

Logger is available under the MIT license. See the LICENSE file for more info.
