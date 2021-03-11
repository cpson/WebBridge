# README

# WebBridge

![https://img.shields.io/travis/cpson/WebBridge.svg?style=flat](https://img.shields.io/travis/cpson/WebBridge.svg?style=flat)

![https://img.shields.io/cocoapods/v/WebBridge.svg?style=flat](https://img.shields.io/cocoapods/v/WebBridge.svg?style=flat)

![https://img.shields.io/cocoapods/l/WebBridge.svg?style=flat](https://img.shields.io/cocoapods/l/WebBridge.svg?style=flat)

![https://img.shields.io/cocoapods/p/WebBridge.svg?style=flat](https://img.shields.io/cocoapods/p/WebBridge.svg?style=flat)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

스토리보드에서 좀 더 편하게 웹 뷰를 제작 하고 싶어서 만들었기 때문에 스토리보드 필수 입니다.

## Installation

**CocoaPods** WebBridge is available through [CocoaPods](https://cocoapods.org/). To install it, simply add the following line to your Podfile:

```
pod 'WebBridge'
```

**Swift Package**

```
https://github.com/cpson/WebBridge.git
```

## How To Use

- 웹 뷰를 스토리보드에 생성.
- "Custom Class"의 Class 값을 WebBridge로 변경
- User Defined Runtime Attributes에서 원하는 값을 설정.

![initial](https://user-images.githubusercontent.com/58577880/110755139-f6589e80-828b-11eb-9158-9e62a0606847.png)

혹은 아래 이미지처럼 Attribute Inspector에서 설정 해도 상관 없습니다.

Default 값으로 표시 하고 싶은데..아직 실력이 부족해서 ......ㅜㅜ

Default값은 WKWebView 설정 시 Default 값과 동일 합니다.

![initial](https://user-images.githubusercontent.com/58577880/110755153-f9538f00-828b-11eb-9ddc-babfae7ca6a7.png)

IBOutlet 으로 웹뷰 연결 후 사용.

## Functions

load(address: String)

 - 내부에서 string 값을 url로 변경 하여 URLRequest 해줍니다. (url 변경 귀찮아서 만들어 놓음)

canOpenUrl(address: String)

 - 내부에서 string 값을 url로 변경 하여 canOpenUrl로 체크 후 오픈 가능하면 open 함수 호출 합니다.

deleteAllCookies()

 - HTTPCookieStorage.shared.cookies 값 제거.

deleteCookie(name: String)

 - HTTPCookieStorage.shared.cookies에서 name이 같으면 해당 값만 제거.

## Author

cpson, cpsony2k@gmail.com

## License

WebBridge is available under the MIT license. See the LICENSE file for more info.
