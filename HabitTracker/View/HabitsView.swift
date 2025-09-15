//
//  HabitsView.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI
import SwiftData

struct HabitsView: View {
    @Environment(\.modelContext) private var context
    @StateObject private var manager: HabitManager
    
    @State private var showingAddDialog = false
    @State private var newItemText = ""
    
    init() {
        _manager = StateObject(wrappedValue: HabitManager.preview)
    }
    
    var body: some View {
        NavigationStack {
            if manager.habits.isEmpty {
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
                            let newHabit = Habit(title: newItemText, streak: 0)
                            manager.addHabit(habit: newHabit)
                        }
                    )
                }
                .onAppear {
                    manager.setContext(context)
                }
            } else {
                List($manager.habits, id: \.id, editActions: .delete) { $habitsListItem in
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
                            let newHabit = Habit(title: newItemText, streak: 0)
                            manager.addHabit(habit: newHabit)
                        }
                    )
                }
                .onAppear {
                    manager.setContext(context)
                }
            }
        }
        
    }
}
