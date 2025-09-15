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
                List {
                    ForEach($manager.habits) { $habit in
                        HabitsListElement(habitsListItem: habit)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                            .contentShape(Rectangle())
                            .onTapGesture {
                                let today = Calendar.current.startOfDay(for: Date())
                                
                                if let last = habit.lastCompleted {
                                    let lastDay = Calendar.current.startOfDay(for: last)
                                    let diff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
                                    
                                    if diff == 1 {
                                        // Ardışık gün, streak artar
                                        habit.streak += 1
                                    } else if diff > 1 {
                                        // Gün atlandı, streak sıfırdan başlar
                                        habit.streak = 1
                                    }
                                    // diff == 0 → bugün zaten tamamlandı, değiştirme
                                    
                                    habit.lastCompleted = Date()
                                } else {
                                    // İlk kez tamamlanıyor
                                    habit.streak = 1
                                    habit.lastCompleted = Date()
                                }
                                
                                // SwiftData için kaydet
                                manager.save()
                            }

                    }
                    .onDelete { index in
                        manager.delete(at: index)
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle("Habits")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddDialog = true
                            newItemText = ""
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
