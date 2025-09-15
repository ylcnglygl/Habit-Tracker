//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct HabitsView: View {
    @StateObject private var manager = HabitManager()
    
    @State private var showingAddDialog = false
    @State private var newItemText = ""
    
    var body: some View {
        NavigationStack {
            if manager.habitsList.isEmpty {
                VStack {
                    Spacer()
                    Text("No habits yet")
                        .font(.title3)
                        .foregroundColor(.gray)
                    Button(action: {
                        showingAddDialog = true
                    }) {
                        Text("Add Habit")
                            .bold()
                            .padding()
                            .frame(minWidth: 150)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    Spacer()
                }
                .sheet(isPresented: $showingAddDialog) {
                    HabitSheetView(
                        text: $newItemText,
                        title: "Add New Habit",
                        primaryText: "Add",
                        onPrimary: {
                            let newCounter = HabitsListItem(title: newItemText, count: 0, countType: "times")
                            manager.habitsList.append(newCounter)
                        }
                    )
                }
            } else {
                List($manager.habitsList, id: \.id, editActions: .delete) { $habitsListItem in
                    HabitsListElement(habitsListItem: $habitsListItem)
                        .listRowInsets(EdgeInsets())
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Habits")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddDialog = true
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddDialog) {
                    HabitSheetView(
                        text: $newItemText,
                        title: "Add New Habit",
                        primaryText: "Add",
                        onPrimary: {
                            let newCounter = HabitsListItem(title: newItemText, count: 0, countType: "times")
                            manager.habitsList.append(newCounter)
                        }
                    )
                }
            }
        }
        
    }
}
