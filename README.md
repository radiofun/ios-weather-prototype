# ios-weather-prototype

A Swift/UIKit port of an iOS Weather app prototype originally built in [Framer.js](http://framerjs.com/examples/preview/#weather-app.framer).

## Overview

`WeatherAppViewController` reconstructs the Framer.js weather prototype natively in Swift. It builds a layered, scroll-driven weather UI with a parallax sky background, a vertically scrollable weather detail panel, a translucent chrome bar, and a city photo. The `UIScrollViewDelegate` coordinates multiple scroll views to produce the characteristic iOS Weather parallax feel.

## Features

- Parallax scrolling between the main weather view and the "today" detail panel
- Layered UIKit composition: background sky, weather scroll, chrome bar, city image, temperature display
- Scroll-linked animations driven by `scrollViewDidScroll`
- Hidden navigation bar for a full-bleed immersive layout
- Faithful recreation of the Framer.js prototype interaction model

## Tech Stack

- **Swift** — UIKit, `UIViewController`, `UIScrollView`, `UIScrollViewDelegate`
- **UIKit** — manual `CGRect` layout, `UIImageView`, `UIEdgeInsets`

## Requirements

- Xcode 7+ (originally created 2015)
- iOS 9+

## Running

1. Open `weather-app.xcodeproj` in Xcode.
2. Add the required image assets (`background`, `weather`, `amsterdam`, `temperature`) to `Images.xcassets`.
3. Build and run on a simulator or device.

## Original Prototype

Based on the [Framer.js weather app example](http://framerjs.com/examples/preview/#weather-app.framer).
