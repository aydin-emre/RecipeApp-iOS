# RecipeApp-iOS
Example Recipe App written in Swift with RxSwift and RxCocoa

<h3>Overview</h3>
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

<h3>Project Setup</h3>
I have used several dependencies through CocoaPods and I excluded pods folder and some other redundant files. However, we need to install them. Go to RecipeApp folder and call pod install command.

```ruby
pod install
```

When you run this command, RecipeApp.xcworkspace file will be created.
Finally, run the project by clicking on this file.
