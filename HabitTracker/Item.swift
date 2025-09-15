//
//  Item.swift
//  HabitTracker
//
//  Created by Yalçın Golayoğlu on 15.09.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
