Inline-style: 
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

[![CI Status](https://img.shields.io/travis/43780301/Twitch.svg?style=flat)](https://travis-ci.org/43780301/Twitch)
[![Version](https://img.shields.io/cocoapods/v/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![License](https://img.shields.io/cocoapods/l/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![Platform](https://img.shields.io/cocoapods/p/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)

## Information
The Twitch iOS SDK is a native wrapper around the [official Twitch API](https://dev.twitch.tv/docs/api/).

## Installation
Twitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Twitch'
```

## Prerequisites
Before you can start using the SDK you need to ![register your app](https://dev.twitch.tv/docs/authentication) on the Twitch developer site.
## Usage

Once you have registered your app and obtained a client ID you are good to go. To initialize the SDK put the following in your [App/Scene]Dekegate:

```swift
Twitch.initialize(clientId: YOUR_CLIENT_ID, config: TWConfig(redirectUri: YOUR_REDIRECT_URI))
```



| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |

## License

Twitch is available under the MIT license. See the LICENSE file for more info.
