//
//  Habits.swift
//  HabitTracker
//
//  Created by Tony Alhwayek on 1/19/24.
//

import Foundation
import SwiftData

@Model
class Habit {
    
    var id = UUID()
    var title: String
    var desc: String
    var timesCompleted: Int = 0
    
    init(id: UUID = UUID(), title: String, desc: String, timesCompleted: Int) {
        self.id = id
        self.title = title
        self.desc = desc
        self.timesCompleted = timesCompleted
    }
    
    
    // // // // // // // // // // // // // // // // //
    // Keeping this here in case I need them later on
    // // // // // // // // // // // // // // // // //
    
    //    enum CodingKeys: CodingKey {
    //        case id
    //        case title
    //        case desc
    //        case timesCompleted
    //    }
    //
    //
    //    required init(from decoder: Decoder) throws {
    //        let container = try decoder.container(keyedBy: CodingKeys.self)
    //        id = try container.decode(UUID.self, forKey: .id)
    //        title = try container.decode(String.self, forKey: .title)
    //        desc = try container.decode(String.self, forKey: .desc)
    //        timesCompleted = try container.decode(Int.self, forKey: .timesCompleted)
    //    }
    //
    //    func encode(to encoder: Encoder) throws {
    //        var container = encoder.container(keyedBy: CodingKeys.self)
    //        try container.encode(id, forKey: .id)
    //        try container.encode(title, forKey: .title)
    //        try container.encode(desc, forKey: .desc)
    //        try container.encode(timesCompleted, forKey: .timesCompleted)
    //    }
}
