//
//  OnboardingView.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct OnboardingView: View {

    let systemImageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.teal)
            
            Text(title)
                .font(.title).bold()
            
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 40)
    }
}
