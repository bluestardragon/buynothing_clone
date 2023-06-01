This is a boilerplate project created in flutter using Provider, Firebase, Dio, and some fundamentals of Robert C Martin's Clean Architecture.

## Getting Started

The boilerplate is a minimal implementation that can be used to create a new project or library. It comes with a variety of basic components such as an app architecture, a theme, and necessary dependencies. The repository code can be used as an initializer to quickly build new projects and reduce the time it takes to develop them.

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```  
https://github.com/GeniusCrew-B-V/genius-architecture-boilerplate.git  
```  

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```  
flutter pub get   
```  

**Step 3:**  
Change the package name by just doing a project wide search and replacing "com.baseprojectsrl.baseproject"  
to the one you desire

**Step 4:**

This project uses code generation for domain/network models and app localization, execute the following command to generate files:

```  
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs  
```  

**Step 5:**

Go to Firebase, create a new project, configure it and place the GoogleServices-Info.plist and google-services.json in the correct positions, if you skip this step the app will not run

