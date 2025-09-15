//
//  HabitSheetView.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct HabitSheetView: View {
    @Binding var text: String
    let title: String
    let primaryText: String
    let onPrimary: () -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.headline)
            
            TextField("Write your new habit...", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                Spacer()
                Button(primaryText) {
                    onPrimary()
                    dismiss()
                }
                .disabled(text.isEmpty)
            }
            .padding(.horizontal)
        }
        .padding()
        .presentationDetents([.fraction(0.32)])
    }
}
