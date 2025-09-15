//
//  HabitsListItem.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 16.09.2025.
//

import SwiftUI

struct HabitsListItem: Codable, Identifiable {
    var id = UUID()
    var title: String
    var count: Int
    var countType: String
    
    init(id: UUID = UUID(), title: String, count: Int, countType: String) {
        self.id = id
        self.title = title
        self.count = count
        self.countType = countType
    }
}
