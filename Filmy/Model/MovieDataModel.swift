//
//  MovieDataModel.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-30.
//

import Foundation

@Observable
class MovieDetails {
    let name: String
        
    let year: String
    
    var isToWatch: Bool
    
    
    
    init(name: String, year: String, isToWatch: Bool) {
        self.name = name
        self.year = year
        self.isToWatch = isToWatch
    }
}



let DunePartTwo = MovieDetails(name: "Dune: Part Two", year: "2024", isToWatch: true)
