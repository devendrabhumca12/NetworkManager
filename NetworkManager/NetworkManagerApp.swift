//
//  NetworkManagerApp.swift
//  NetworkManager
//
//  Created by Devendra Agnihotri on 12/01/23.
//

import SwiftUI

@main
struct NetworkManagerApp: App {
    let networkManager = NetworkManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(networkManager)
        }
    }
}
