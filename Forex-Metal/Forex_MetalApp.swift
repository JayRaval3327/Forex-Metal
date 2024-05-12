//
//  Forex_MetalApp.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-04-22.
//

import SwiftUI

@main
struct Forex_MetalApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Server.selected = .vadilal
        return true
    }
}
