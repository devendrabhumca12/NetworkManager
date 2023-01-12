//
//  ContentView.swift
//  NetworkManager
//
//  Created by Devendra Agnihotri on 12/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var networkManager: NetworkManager
    
    @State var isOnline = false
    
    var body: some View {
        var x = print("landmark1: \(networkManager.networkType)")
       
        var z = print("landmark3: \(networkManager.isConnected)")
        VStack(spacing: 12) {
            Image(systemName: networkManager.isConnected ? "wifi" : "wifi.slash").font(.largeTitle)
            Button(action: {
                isOnline = networkManager.isConnected
            }, label: {
                Text("Refresh manually")
            })
            
            if isOnline {
                Text("Showing this text only after we tapped the Button and if network is Connected")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
