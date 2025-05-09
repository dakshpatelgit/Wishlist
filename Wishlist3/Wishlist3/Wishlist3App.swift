//
//  Wishlist3App.swift
//  Wishlist3
//
//  Created by m1 on 19/04/2025.
//

import SwiftUI
import SwiftData

@main
struct Wishlist3App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}
