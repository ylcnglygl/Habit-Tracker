//
//  ContentView.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 15.09.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        WelcomeView()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
