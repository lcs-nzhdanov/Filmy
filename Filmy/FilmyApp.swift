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
    
    @State private var moviesList: [MovieDetails] = [DunePartTwo, Batman]
    
    @State private var libraryList: [MovieDetails] = []
    
    @State private var didLike: [MovieDetails] = []
    @State private var didNotLike: [MovieDetails] = []
  
    
    var body: some Scene {
        WindowGroup {
            LandingView(
                selectedTab: $selectedTab,
                moviesList: $moviesList,
                libraryList: $libraryList,
                didLike: $didLike,
                didNotLike: $didNotLike
            )
            
//            RecomendationsGetterView()
        }
    }
}
