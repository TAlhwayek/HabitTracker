//
//  Challenge__4App.swift
//  Challenge #4
//
//  Created by Tony Alhwayek on 1/19/24.
//

import SwiftData
import SwiftUI

// Registering user defaults to default to on
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UserDefaults.standard.register(defaults: ["ShowQuotes": true])
        UserDefaults.standard.register(defaults: ["ShowConfetti": true])
        UserDefaults.standard.register(defaults: ["PerformVibration": true])
        return true
    }
}

@main
struct HabitTracker_App: App {
    // This is also needed for registering
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    // Handling themes
    // Optional = defaults to system theme
    @AppStorage("selectedTheme") var selectedTheme: String?
    
    var body: some Scene {
        WindowGroup {
            Tabs()
                .preferredColorScheme(getColorScheme())
        }
        .modelContainer(for: Habit.self)
//        .modelContainer(for: ToDo.self)
    }
    
    func getColorScheme() -> ColorScheme? {
        switch selectedTheme {
        case "light":
            return .light
        case "dark":
            return .dark
        default:
            return nil // Use system theme
        }
    }
}


