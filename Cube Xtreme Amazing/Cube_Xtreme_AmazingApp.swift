//
//  Cube_Xtreme_AmazingApp.swift
//  Cube Xtreme Amazing


import SwiftUI

@main
struct Cube_Xtreme_AmazingApp: App {
    
    
    
    
    @UIApplicationDelegateAdaptor(CubeXtremeAppDelegate.self) private var appDelegate
    var body: some Scene {
        WindowGroup {
            CubeXtremeGameInitialView()
        }
    }
}
