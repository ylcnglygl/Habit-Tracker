//
//  WelcomeView.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var body: some View {
        if hasSeenOnboarding {
            ZStack {
                Color(uiColor: .systemBackground)
                VStack {
                    HabitsView()
                }
            }
        } else {
            ZStack(alignment: .topTrailing) {
                TabView(selection: $currentPage) {
                    OnboardingView(
                        systemImageName: "checkmark.circle",
                        title: "Build Better Habits",
                        description: "Create daily, weekly, or custom habits to improve your lifestyle."
                    )
                    .tag(0)
                    
                    OnboardingView(
                        systemImageName: "calendar",
                        title: "Stay on Track",
                        description: "Track your progress and never lose sight of your goals."
                    )
                    .tag(1)
                    
                    OnboardingView(
                        systemImageName: "sparkles",
                        title: "Celebrate Progress",
                        description: "Stay motivated by celebrating your streaks and milestones."
                    )
                    .tag(2)
                }

                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                
                // 3. sayfadaysa gösterilecek buton
                if currentPage == 2 {
                    Button("Skip") {
                        hasSeenOnboarding = true
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }
        }
    }
}

