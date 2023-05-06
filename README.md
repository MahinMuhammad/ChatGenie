
<!-- Copyright 2023 Md. Mahinur Rahman-->
<!---->
<!-- Licensed under the Apache License, Version 2.0 (the "License");-->
<!-- you may not use this file except in compliance with the License.-->
<!-- You may obtain a copy of the License at-->
<!---->
<!--     http://www.apache.org/licenses/LICENSE-2.0-->
<!---->
<!-- Unless required by applicable law or agreed to in writing, software-->
<!-- distributed under the License is distributed on an "AS IS" BASIS,-->
<!-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.-->
<!-- See the License for the specific language governing permissions and-->
<!-- limitations under the License.-->
 

<h1>ChatGenie</h1>
  ChatGenie is an iOS app that lets users chat with an AI. The app includes log in and register functionality with Firebase Auth and also has Firebase Firestore for storing chats. In addition, ChatGenie utilizes third-party libraries such as IQKeyboardManagerSwift and JVFloatLabeledTextField for improved user experience.

<h3>Graphical User Interface</h3>
  <table style="border:none">
    <tr>
        <td><img src="Documentation/welcome.png" height="350"></td>
        <td><img src="Documentation/reg.png" height="350"></td>
        <td><img src="Documentation/login.png" height="350"></td>
        <td><img src="Documentation/chatView.png" height="350"></td>
     </tr>
  </table>

<h3>Getting Started</h3>
  To clone this app and run it on Xcode, follow these steps:

<ol>
    <li>Clone the repository: git clone https://github.com/MahinMuhammad/ChatGenie.git</li>
    <li>Create a firebase app on firebase.</li>
    <li>Download and GoogleService-Info.plist to project.</li>
    <li>Create a 'pool' named collection on firestore.</li>
    <li>Insert Random messages for bot to reply with on firestore 'pool' collection.</li>
    <li>Open the ChatGenie.xcodeproj file in Xcode.</li>
    <li>Install any required dependencies using CocoaPods or SPM.</li>
    <li>Build and run the project in Xcode.</li>
</ol> 
  
<h3>Features</h3>

<ul>
    <li>Log in and register with Firebase Auth</li>
    <li>Store chat history with Firebase Firestore</li>
    <li>Chat with an AI</li>
    <li>Improved user experience with IQKeyboardManagerSwift and JVFloatLabeledTextField</li>
</ul>   
  
<h3>Future Updates</h3>
  In the next update, I plan to add OpenAI chat completion API for an even more seamless experience.

<h3>Contributing</h3>
  I welcome contributions from the community! To contribute to ChatGenie, follow these steps:

<ol>
    <li>Fork the repository.</li>
    <li>Create a new branch for your feature: git checkout -b feature/your-feature-name.</li>
    <li>Make your changes and commit them: git commit -m "Add your commit message here".</li>
    <li>Push your changes to your forked repository: git push origin feature/your-feature-name.</li>
    <li>Submit a pull request to the main repository.</li>
</ol>
  
<h3>License</h3>
  This project is licensed under the Apache License 2.0 - see the LICENSE file for details.

<h3>Contact</h3>
  If you have any questions or comments about ChatGenie, feel free to reach out to me at rahmanmahin@icloud.com.

<hr>
<table style="border:none">
  <tr>  
    <td align="center"><img src="Documentation/mahinsLogo.png" height="250" width="250"></h4></td>
  </tr>
  <tr>  
    <td align="center"><h4>Developed by <br> Md. Mahinur Rahman</h4></td>
  </tr>
</table>
