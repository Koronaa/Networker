# Networker
#### Swift package written on top of [Alamofire](https://github.com/Alamofire/Alamofire) which does the heavy lifting in your network layer for you.
[![Swift](https://img.shields.io/badge/Swift-5.5_5.6_5.7_5.8-orange?style=flat-square)](https://img.shields.io/badge/Swift-5.5_5.6_5.7_5.8-Orange?style=flat-square) [![Platforms](https://img.shields.io/badge/Platforms-iOS_13+-yellowgreen?style=flat-square)](https://img.shields.io/badge/Platforms-iOS_13+-Green?style=flat-square) [![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)


### Version Compatibility

Networker has been tested for folowwing versions of [Alamofire](https://github.com/Alamofire/Alamofire)

- Alamofire v 5.7.1

### Requirement 
 
 | Platform | Minimum Swift Version | Installation | Status |
| --- | --- | --- | --- |
| iOS 13.0+ | 5.5 | [Swift Package Manager](#swift-package-manager)| Fully Tested |


### Installation

###### Swift Package Manager

The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

Once you have your Swift package set up, adding Networker as a dependency is as easy as adding it to the dependencies value of your Package.swift.

```swift
dependencies: [
    .package(url: "https://github.com/Koronaa/Networker.git", .upToNextMajor(from: "1.0.0"))
]
```
### Usage

Please refer to the sample app [here]()

### Release History

- v 1.0.0 - Initial Release


### License
Networker is released under the MIT license. See [LICENSE](https://github.com/Koronaa/Networker/blob/main/LICENSE) for details.



