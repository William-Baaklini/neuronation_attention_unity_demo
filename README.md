# Neuronation FlutterxUnity POC

[Download APK](https://1drv.ms/u/s!ApvYE4irPfsAi0Cd-AyPMqpKl0y4?e=fiVpvX)

### Prerequesites
 - Flutter 3.3.0 • channel stable • https://github.com/flutter/flutter.git  
 - Unity 2021.2.9f1 LTS with android, iOS build support  
 - Xcode 14.1  
 - VS Code (Flutter Extension Installed)
 
### Creating your flutter project
 1 - Using VS Code enter the command pallete and create a flutter project  
 ![Create Flutter with VS Code](https://user-images.githubusercontent.com/76127831/203063780-a24fa10c-0be8-4b06-82b7-fcdfa3d30a37.png)
 
 2 - Update the yaml to get flutter unit widget  
 ![Update Yaml File](https://user-images.githubusercontent.com/76127831/203064457-0546efd8-9a78-4a95-bd51-91f439cff1d9.png)
 
 3 - Crete a folder called unity inside the flutter project  
 ![Create unity directory](https://user-images.githubusercontent.com/76127831/203064735-2f324cd7-1caa-476d-a933-cce3e4f96e52.png)
 
 4 - Swap the lib/main.dart with the one in the repository

### Creating the unity project
 1 - Using Unity Hub Create a unity project inside the unity directory in the flutter project files  
 ![Creating Unity Project](https://user-images.githubusercontent.com/76127831/203065130-a3ea63f7-7e4c-49df-8676-9f8096b25b4b.png)
 
 2 - After the project loads add the unity package that is inside /unity in this repo  
 ![Add Project Package](https://user-images.githubusercontent.com/76127831/203065724-7b43c1d5-24f4-497b-8e39-1baa190ca524.png)
 
 3 - Add Game Scene to the build setting  
 ![Add Scene](https://user-images.githubusercontent.com/76127831/203065886-b2b21e5d-d264-459c-b741-849f74150b7f.png)

### Running for android  
 To run for android you can use the apk I already built  for you [Download](https://1drv.ms/u/s!ApvYE4irPfsAi0Cd-AyPMqpKl0y4?e=fiVpvX) or you can follow these steps to build yourself.  
 1 - Update Player Build settings as follow:  
 Set Graphics API to OpenGLS3 only  
 ![build setting 1](https://user-images.githubusercontent.com/76127831/203066852-61dc65a6-87fb-4c1d-a7dc-260f1348e0aa.png)  
 Set Scripting Backend to IL2CPP and target architecture to both 64 and v7  
 ![build setting 2](https://user-images.githubusercontent.com/76127831/203067605-bdf4d855-3f5d-4cf5-9aed-e191e27defd3.png)  

 2 - In the Editor Menu Click on Flutter > Export Android (Release or Debug)  
 ![Export to Android](https://user-images.githubusercontent.com/76127831/203068224-b8323d58-9fe3-4aca-b978-bfec6f4e446f.png)
 
 3 - After the export, inside the flutter project edit android/app/build.gradle  
 ![edit build.gradle 1](https://user-images.githubusercontent.com/76127831/203069220-35fba742-a32a-4282-9db2-905ca82eb6ea.png)
 ![edit build.gradle 2](https://user-images.githubusercontent.com/76127831/203069137-47f14d43-e668-46ba-a57d-affd0adb0a0b.png)
 
 4 - Edit android/local.properties with NDK path that your unity use, and  
 ![edit prop](https://user-images.githubusercontent.com/76127831/203069576-0b9b348a-ccd7-4e1d-b7ca-bfb12b178a43.png)
 
 4 - In the VS terminal run command ```flutter build apk --split-per-abi``` and the project will build the apks you need inside buil/app/outputs/flutter-apk
 
 ### Running for iOS
  1 - Update the player settings  
  ![player settibgs](https://user-images.githubusercontent.com/76127831/203070822-fe888bef-a968-46c2-b30e-d9eb78c7e8ed.png)
  
  2 - In the Editor Menu Flutter > Export IOS (Release or Debug)  
  ![export ios](https://user-images.githubusercontent.com/76127831/203071385-4e650bcc-9fd2-45c7-aaba-7f2e2e29722f.png)

  3 - In the Flutter Project edit ios/AppDelegates.swift  
  ![appdelegates](https://user-images.githubusercontent.com/76127831/203072004-3d9fe133-621e-40ac-b9d3-72a717eef5d2.png)
  
  4 - Edit ios/Info.plist  
  ![image](https://user-images.githubusercontent.com/76127831/203072158-4a6e80ce-f5d9-4bc4-a5f8-3cd615714112.png)

  5 - Run the flutter project to update the xcode workspace press F5 in VS
  
  6 - Open the ios/Runner.xcworkspace (workspace, not the project) file in Xcode, right-click on the Navigator (not on an item), go to Add Files to "Runner" and add the ios/UnityLibrary/Unity-Iphone.xcodeproj file.  
  ![image](https://user-images.githubusercontent.com/76127831/203072632-6ca77e66-9407-454c-a41d-799680e35360.png)  
  
  7 - Add UnityFramework.framework to the Runner  
 ![image](https://user-images.githubusercontent.com/76127831/203072997-60c51290-47d4-48d9-90d5-05429fe61c19.png)

  9 - in Xcode Menu go to Product > Scheme > Edit Scheme and turn off Thread Performance Checker  
  ![image](https://user-images.githubusercontent.com/76127831/203073505-1b303aae-8815-410a-ad4f-741ea86e2e4c.png)

  8 - After that Run the project from Xcode with the target device specified

 ### References
 [flutter_unity_widget](https://github.com/juicycleff/flutter-unity-view-widget)
