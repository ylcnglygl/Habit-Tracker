//
//  HabitsListElement.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct HabitsListElement: View {
    @Binding var habitsListItem: Habit
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.blue)
                .frame(height: 100)
            
            HStack {
                Text(habitsListItem.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(uiColor: .label))
                    .padding()
                
                Spacer()
                
                Divider()
                    .frame(width: 1, height: 100)
                    .background(Color.white.opacity(0.6))
                
                Spacer()
                
                Text("\(habitsListItem.streak)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color(uiColor: .label))
                
                Spacer()
            }
            
        }
        .padding()
    }
}
