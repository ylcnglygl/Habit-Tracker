//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 15.09.2025.
//

import SwiftUI
import SwiftData

@main
struct HabitTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Habit.self)
    }
}
