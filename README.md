![Twitch banner](/Assets/twitch-header.svg "Twitch banner")

[![CI Status](https://img.shields.io/travis/43780301/Twitch.svg?style=flat)](https://travis-ci.org/43780301/Twitch)
[![Version](https://img.shields.io/cocoapods/v/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![License](https://img.shields.io/cocoapods/l/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![Platform](https://img.shields.io/cocoapods/p/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)

## Information
The Twitch iOS SDK is a modern, lightweight wrapper around the [official Twitch API](https://dev.twitch.tv/docs/api/). Its main purpose is to make your life easier when building apps that needs to integrate with the various Twitch services.

## Installation
Twitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Twitch'
```

## Prerequisites
Before you can start using the SDK you need to [register your app](https://dev.twitch.tv/docs/authentication) on the Twitch developer site.
## Usage

Once you have registered your app and obtained a client ID you are good to go. To initialize the SDK put the following in your [App/Scene]Delegate:

```swift
Twitch.initialize(clientId: YOUR_CLIENT_ID, config: TWConfig(redirectUri: YOUR_REDIRECT_URI))
```



### Available API Calls

| API Method | Swift Function | API Version |
| ------------- | ------------- | ------------- |
| Get Cheermotes | Twitch.Bits.getCheermotes | Helix |
| Get Bits Leaderboard | Twitch.Bits.getBitsLeaderboard | Helix |
| Get Game Analytics | Twitch.Analytics.getGameAnalytics | Helix |
| Get Extension Transactions | Twitch.Extensions.getTransactions | Helix |
| Create Clip | Twitch.Cliips.createClip | Helix |

## License

Twitch is available under the MIT license. See the LICENSE file for more info.
