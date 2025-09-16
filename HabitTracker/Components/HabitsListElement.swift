//
//  HabitsListElement.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct HabitsListElement: View {
    var habitsListItem: Habit
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(height: 100)
            
            HStack {
                Text(habitsListItem.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                Text("\(habitsListItem.streak)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 36)
            }
            
        }
        .padding()
    }
}
