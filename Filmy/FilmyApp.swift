//
//  FilmyApp.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-29.
//

import SwiftUI

@main
struct FilmyApp: App {
    
    @State private var selectedTab = 1
    
    var body: some Scene {
        WindowGroup {
            LandingView(selectedTab: $selectedTab)
        }
    }
}
