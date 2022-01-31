# RecipeApp-iOS
Example Recipe App written in Swift with RxSwift and RxCocoa

## Overview
This is an example app written by Emre AYDIN on 01.31.2022<br>
<ul>
    <li>MVVM Design Pattern used with Reactive programming.</li>
    <li>https://cookpad.github.io/global-mobile-hiring/api/ used for API calls.</li>
    <li>SwiftLint used to enforce Swift style and conventions.</li>
    <li>Unit Tests written to check proper decoding of collections and recipes.</li>
</ul>

<h3>Screenshots</h3>
<table>
  <tr>
    <td>
        <img src="/screenshots/1.jpg">
    </td>
    <td>
        <img src="/screenshots/2.jpg">
    </td>
  </tr>
  <tr>
    <td>
        <img src="/screenshots/3.jpg">
    </td>
    <td>
        <img src="/screenshots/4.jpg">
    </td>
  </tr>
</table>

## How To Setup Project
I have used several dependencies through CocoaPods but I excluded pods folder and some other redundant files.
However, we need to install them on our pc. Go to RecipeApp directory and call pod install command.

```ruby
pod install
```

When you run this command, RecipeApp.xcworkspace file will be created.
And, run the project by clicking on this file.

## About Project
In this project I used Alamofire for networking, EAAlert for custom alerts, RxSwift/RxCocoa for reactive programming, and SDWebImage for loading images.
By the way, [EAAlert](https://cocoapods.org/pods/EAAlert) was developed by me and that's why I especially used it :)
This project contains two screens which show collections and recipes. When you click on any collection, recipes screen will be presented to show the recipes in the collection.
There are two custom views for collections and recipes. And, they are used in uicollectionviewcells.
I have tried to adapt SOLID principles.
I have created some shared instances to make it singleton.
I have created Repository and Protocols and used them for injections.
I have created some extensions to prevent repeating myself.
I have used MVVM design pattern with reactive programming.

## Additionally
I might do some additional developments if I were to continue working on the project.
For UI side, I was planning to create a fancy recipe detail screen.
And also, I was planning to create ViewControllers from a TabBarController class by initializing with appropriate ViewModels.

## Author

aydin-emre, www.emr.ee

## License

EAAlert is available under the MIT license. See the LICENSE file for more info.
