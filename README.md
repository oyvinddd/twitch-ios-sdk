![Twitch banner](/Assets/twitch-header.svg "Twitch banner")

[![CI Status](https://img.shields.io/travis/43780301/Twitch.svg?style=flat)](https://travis-ci.org/43780301/Twitch)
[![Version](https://img.shields.io/cocoapods/v/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![License](https://img.shields.io/cocoapods/l/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![Platform](https://img.shields.io/cocoapods/p/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)

## Information
The Twitch iOS SDK is a modern, lightweight wrapper around the [official Twitch API](https://dev.twitch.tv/docs/api/). Its main purpose is to make your life easier when building apps that needs to integrate with the various Twitch services. Note that, although the SDK does support the older Twitch API (V5/Kraken), it has been deprectaed and will most likely be removed by Twitch in the near future.

## Installation
Twitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Twitch'
```

## Prerequisites
Before you can start using the SDK you need to [register your app](https://dev.twitch.tv/docs/authentication) on the Twitch developer site.

## Usage

### 1. Initialization
Once you have registered your app and obtained a client ID you are good to go. To initialize the SDK put the following in your application's ```application(_:didFinishLaunchingWithOptions:)``` (or in the related scene delegate method):

```swift
// A configuration with redirect uri and scope(s) needs to be specified
let config = TWConfig(redirectUri: "REDIRECT_URI", scopes: [TWConfig.Scope.openid])
// Initialize the Twitch object with client ID and configuration
Twitch.initialize(clientId: "CLIENT_ID", config: config)
```

### 2. Getting an access token
TODO:

### 3. Calling the API
TODO:

## Available API Calls

| API Method | Swift Function | API Version |
| ------------- | ------------- | ------------- |
| Get Cheermotes | Twitch.Bits.getCheermotes | Helix |
| Get Bits Leaderboard | Twitch.Bits.getBitsLeaderboard | Helix |
| Get Game Analytics | Twitch.Analytics.getGameAnalytics | Helix |
| Get Extension Transactions | Twitch.Extensions.getTransactions | Helix |
| Create Clip | Twitch.Clips.createClip | Helix |
| Get Clips | Twitch.Clips.getClips | Helix |
| Create Entitlement Grants Upload URL | Twitch.Entitlements.TODO | Helix |
| Get Code Status | Twitch.Entitlements.getCodeStatus | Helix |
| Redeem Code | Twitch.Entitlements.redeemCode | Helix |
| Get Top Games | Twitch.Games.getTopGames | Helix |
| Get Games | Twitch.Games.getGames | Helix |
| Check Automod Status | Twitch.Moderation.checkAutomodStatus | Helix |
| Get Banned Users | Twitch.Moderation.getBannedUsers | Helix |
| Get Banned Events | Twitch.Moderation.getBannedEvents | Helix |
| Get Moderators | Twitch.Moderation.getModerators | Helix |
| Get Moderator Events | Twitch.Moderation.getModeratorEvents | Helix |
| Search Categories | Twitch.Search.searchCategories | Helix |
| Search Channels | Twitch.Search.searchChannels | Helix |
| Get Stream Key | Twitch.Streams.getStreamKey | Helix |
| Get Streams | Twitch.Streams.getStreams | Helix |
| Create Stream Marker | Twitch.Streams.createStreamMarker | Helix |
| Get Stream Markers | Twitch.Streams.getStreamMarkers | Helix |
| Get Channel Information | Twitch.Streams.getChannelInfo | Helix |
| Modify Channel Information | Twitch.Streams.modifyChannelInfo | Helix |
| Get Broadcaster Subscriptions | Twitch.Subscriptions.getBroadcasterSubscriptions | Helix |
| Get All Stream Tags | Twitch.Tags.getAllStreamTags | Helix |
| Get Stream Tags | Twitch.Tags.getStreamTags | Helix |
| Replace Stream Tags | Twitch.Tags.replaceStreamTags | Helix |
| Create User Follows | Twitch.Users.createUserFollows | Helix |
| Delete User Follows | Twitch.Users.deleteUserFollows | Helix |
| Get Users | Twitch.Clips.getUsers | Helix |
| Get Users Follows | Twitch.Users.getUsersFollows | Helix |
| Update User | Twitch.Clips.updateUser | Helix |
| Get User Extensions | Twitch.Users.getUserExtensions | Helix |
| Get User Active Extensions | Twitch.Users.getUserActiveExtensions | Helix |
| Update User Extensions | Twitch.Users.updateUserExtensions | Helix |
| Get Videos | Twitch.Videos.getVideos | Helix |
| Get Webhook Subscription | Twitch.Subscriptions.getWebhookSubscriptions | Helix |
| Get Hype Train Events | Twitch.HypeTrain.getHypeTrainEvents | Helix |


## License
Twitch is available under the MIT license. See the LICENSE file for more info.
