![Twitch banner](/Assets/twitch-header.svg "Twitch banner")

[![CI Status](https://img.shields.io/travis/43780301/Twitch.svg?style=flat)](https://travis-ci.org/43780301/Twitch)
[![Version](https://img.shields.io/cocoapods/v/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![License](https://img.shields.io/cocoapods/l/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)
[![Platform](https://img.shields.io/cocoapods/p/Twitch.svg?style=flat)](https://cocoapods.org/pods/Twitch)

## Information

**⚠️ THIS SOFTWARE IS UNOFFICIAL AND IS IN NO WAY ENDORSED BY TWITCH.TV ⚠️**

This SDK is a modern, lightweight wrapper around the [official Twitch API](https://dev.twitch.tv/docs/api/). Its main purpose is to make your life easier when building apps that needs to integrate with the various Twitch services. The code is 100% Swift and does not rely on any external dependencies. Deployment target has been set to **iOS 12**.

**Note!** Although the SDK does support some of [the old Twitch API](https://dev.twitch.tv/docs/v5) (V5/Kraken) services, these have been deprecated in favor of the new Helix API services and will most likely be completely removed by Twitch in the near future.

## Installation
Twitch is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Twitch'
```

## Prerequisites
Before you can start using the SDK you need to [register your app](https://dev.twitch.tv/docs/authentication#registration) on the Twitch developer site.

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
#### 2.1 OAuth Token (implicit flow)
The simplest way to retrieve an OAuth 2.0 access token is by using the included ```TWAuthViewController```:

```swift
final class MyViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // This presents a web view where the user can login to his/her Twitch account
        // The SDK will get notified of a successful login in the delegate method didFetchOAuthToken
        present(TWAuthViewController(delegate: self), animated: true, completion: nil)
    }
}

extension MyViewController: TWAuthDelegate {

    // After a user has successfully logged in to Twitch, this method is called 
    func didFetchOAuthToken(_ accessToken: String) {
        Twitch.credentials.set(accessToken: accessToken)
    }
}
```

#### 2.2 OIDC Token (implicit flow)
TODO: ...

### 3. Calling the API
The example below fetches all the top games (by number of current viewers) on Twitch.

```swift
Twitch.Games.getTopGames { result in
    // Note! It's safe to call UI updates from this block
    switch result {
    case .success(let container):
        for game in container.data {
            print(game)
        }
        break
    case .failure(let error):
        print(error.localizedDescription)
    }
}

// This prints the following:
// TWGame(id: "509658", name: "Just Chatting", boxArtUrl: "...")
// TWGame(id: "21779", name: "League of Legends", boxArtUrl: "...")
// TWGame(id: "33214", name: "Fortnite", boxArtUrl: "...")
// ...
```

## Available API Calls

| API Method | Swift Function | Supported? |
| ------------- | ------------- | ------------- |
| Get Cheermotes | Twitch.Bits.getCheermotes | ❌ |
| Get Bits Leaderboard | Twitch.Bits.getBitsLeaderboard | ❌ |
| Get Game Analytics | Twitch.Analytics.getGameAnalytics | ❌ |
| Get Extension Transactions | Twitch.Extensions.getTransactions | ❌ |
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
