# Startuper

Idea builder helps you formulate your startup ideas into reality.

## Technologies

Flutter, Firebase

## Architecture 

This project follows a twist of MVVM without the two way binding by using the [stacked](https://pub.dev/packages/stacked) package. The architecture has three pillars: Views, ViewModels, and Services.

- `Views` are the UI you see in the application. Views should have minimum logic to them, all the logic should really be handled in its corresponding ViewModel. In other words, Views should only render the state of its ViewModel...like React, declarative.

- `ViewModels` make use of different services to achieve what the user is requesting through their interactions. It manages the state of the View and contains business logic that can manipulate the data the View needs. It does this by making use of Services. I prefer to have a 1:1 relationship with a View and a ViewModel because it makes it easy to reason about and also keeps your file structure clean. I find only in rare cases can you reuse a ViewModel with different Views (good or bad thing? After a week into Flutter, I'm not too sure 😅). 

- `Services` provide the functionality of various features your app needs. I create a Service per feature so if I need authentication, I create an [AuthenticationService](https://github.com/phc5/startuper/blob/master/lib/services/authentication.dart). The kind folks at FilledStacks created a packaged called [stacked_services](https://pub.dev/packages/stacked_services) that includes some commonly used functionalities like navigation, dialog, and snackbar. 


In our views, we use `ViewModelBuilder` to bind our Views to our ViewModels. `ViewModelBuilder` has two constructors: `.reactive()` and `.nonReactive()`. When a function in our ViewModel calls `notifyListeners()`, the Views with the `.reactive()` constructor will react to the changes and rebuild your UI with the newly updated ViewModel state.

There's much more to the `stacked` architecture and I've only scratched the surface. I'm interested to see how well this scales.

## Project Structure

The project structure for this application draws its hierarchy from the application architecture described above. The source code lives in a `lib` directory that contains serveral subdirectories: 

```
lib/
├── app/
├── main.dart
├── models/
├── services/
└── ui/
    ├── shared/
    ├── views/
    └── widgets/
```
Since the project structure follows the application architecture, files and directories are grouped together by their own concerns which has made organizing and developing much easier and enjoyable. 

The one pillar of the application architecture that is not shown on the tree diagram is the `ViewModel`. I found that keeping the `View` and the `ViewModel` in different directories didn't make much sense since they are tied together. While developing, I found myself jumping back and forth between the `View` and `ViewModel`, so I opted to keep the `View` and `ViewModel` in the same directory for each `view`. 

For example:

```
views/
└── login_view/
    ├── login_view.dart
    └── login_viewmodel.dart
```

## Local Development

There's a few things you need to add before you can start developing locally.

After you pull down the repo, you wil need to have Flutter and Dart installed. Luckily, the Flutter team makes this easy: [Flutter Installation](https://flutter.dev/docs/get-started/install). 

You will also have to install an IDE. The recommended IDE is Android Studio but you can also use other editors like VS Code. I normally use VS Code, but switching to Android Studio wasn't much of a problem. 

After installing the necessary dependencies, you will have to create a Firebase account and create a new Firebase project (this is for those who are not on the development team for startuper). When you create your new Firebase project, you will be given instructions on how to add `google-services.json` to your codebase for each operating system: iOS and Android. Once you add these services, you should be good to go. 

If you have any questions, please do not hesitate to contact me or file an issue.

## Dev Notes

- `rm -rf ios/Flutter/App.framework` to fix error  `"Building for iOS simulator, but the linked and embedded framework App.framework was built for iOS."`.
- `flutter packages pub run build_runner clean` to clear generated files like routes and locator.
- `flutter packages pub run build_runner build` to build routes and locator files.



