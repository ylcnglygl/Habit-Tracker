//
//  SplashScreen.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()  // Ana ekranın
        } else {
            VStack {
                Image("SplashLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                Text("HabitTracker")
                    .font(.title)
                    .bold()
                    .padding()
                Text("Track and Improve Your Daily Habits")
                    .font(.title2)
                    .padding()
            }
            
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
}
