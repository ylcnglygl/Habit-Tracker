//
//  HabitManager.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI
import SwiftData
import Foundation

// 1. Model tanımı
@Model
class Habit {
    @Attribute(.unique) var id: UUID
    var title: String
    var createdAt: Date
    var streak: Int
    var lastCompleted: Date?
    
    init(title: String, streak: Int = 0) {
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.streak = streak
        self.lastCompleted = nil
    }
}

// 2. Manager sınıfı
@MainActor
class HabitManager: ObservableObject {
    @Published var habits: [Habit] = []
    private var context: ModelContext?

    init(context: ModelContext? = nil) {
        self.context = context
        if let context = context {
            loadHabits(from: context)
        }
    }

    static var preview: HabitManager {
        HabitManager() // boş context ile çalışır, SwiftUI Preview için
    }

    func setContext(_ context: ModelContext) {
        self.context = context
        loadHabits(from: context)
    }

    private func loadHabits(from context: ModelContext) {
        do {
            let descriptor = FetchDescriptor<Habit>(sortBy: [SortDescriptor(\.createdAt)])
            habits = try context.fetch(descriptor)
        } catch {
            print("Failed to fetch habits: \(error)")
        }
    }

    func addHabit(habit: Habit) {
        guard let context else { return }
        context.insert(habit)
        save()
    }

    func delete(at offsets: IndexSet) {
        guard let context else { return }
        for index in offsets {
            context.delete(habits[index])
        }
        save()
    }

    func save() {
        guard let context else { return }
        do {
            try context.save()
            loadHabits(from: context)
        } catch {
            print("Failed to save habits: \(error)")
        }
    }
}


