//
//  Wish.swift
//  Wishlist3
//
//  Created by m1 on 19/04/2025.
//

import Foundation
import SwiftData

@Model
class Wish {
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}
