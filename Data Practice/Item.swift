//
//  Item.swift
//  Data Practice
//
//  Created by Andy Dobbs on 1/6/24.
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

@Model
final class Todo {
    var title: String
    
    init(title: String) {
        self.title = title
    }
}
