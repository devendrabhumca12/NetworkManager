#  NetworkManager
NetworkManager is a simple and lightweight class written in SwiftUI to handle all of your network state management in your iOS projects. It provides a clean and easy-to-use interface for monitoring network connectivity, and updating your app's UI accordingly.

### Requirements

![swift v5.3](https://img.shields.io/badge/swift-v5.3-orange.svg)
![platform iOS](https://img.shields.io/badge/platform-iOS-blue.svg)
![deployment target iOS 13](https://img.shields.io/badge/deployment%20target-iOS%2013-blueviolet)

## Features

Here's the list of the awesome features `NetworkManager` has:
- [X] Simple and easy-to-use interface
- [X] Automatically updates the UI when the network state changes
- [X] Monitors the network state in real-time.
- [X] Provides an observable object for binding to in SwiftUI.
- [X] Can be easily integrated with other parts of your app to handle network-related logic.

### Installation
To install NetworkStateManager, simply add the NetworkStateManager.swift file to your Xcode project and enjoy 🙂.

## 💻 How to use

First create a `NetworkState` object and add it as an `environmentObject` to your root `View`.

```
import SwiftUI

@main
struct NetworkStateDemoApp: App {
    
    let networkState = NetworkState()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(networkState)
        }
    }
}
```
use the `isConnected` variable to render out your UI. For more understanding download and run the project. 

```
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkManager: NetworkManager
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: networkManager.isConnected ? "wifi" : "wifi.slash").font(.largeTitle)
            
            let status = networkManager.isConnected == true ? "Online" : "Offline"
            Text("You are \(status) and connected to \(networkManager.networkType?.rawValue ?? "")")
                .foregroundColor(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```
### Customization
You can also customize the behavior of NetworkManager by subclassing it and overridding the methods you want to change.

### Contribution
Your contributions and suggestions are always welcome. Feel free to open an issue or create a pull request.

## 📃 License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

### Note
This is just a sample README.md, you can add more details, examples and so on based on the actual implementation of your NetworkManager.swift class.
