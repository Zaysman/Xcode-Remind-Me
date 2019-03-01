//
//  Reminder.swift
//  Remind-Me
//
//  Created by Isaiah X Smith on 2/28/19.
//  Copyright © 2019 Isaiah X Smith. All rights reserved.
//

import Foundation

struct Reminder {
    
    let text: String
    var completed: Bool
    
    mutating func toggleCompleted() { //because we're modifying a variable, we use the keyword mutating. mutating is only for structs
        completed = !completed
    }

}
