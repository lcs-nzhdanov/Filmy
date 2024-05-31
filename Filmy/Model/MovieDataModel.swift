//
//  MovieDataModel.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-30.
//

import Foundation

func minutesToHours(lengthMinutes: Int) -> String {
    let hours: Int = lengthMinutes / 60
    let minutes: Int = lengthMinutes % 60
    
    return (minutes == 0 ? "\(hours)h": "\(hours)h \(minutes)m")
}

@Observable
class MovieDetails {
    let name: String
    let lengthMinutes: Int
    let year: String
    
    var isToWatch: Bool
    
    
    
    init(name: String, lengthMinutes: Int, year: String, isToWatch: Bool) {
        self.name = name
        self.lengthMinutes = lengthMinutes
        self.year = year
        self.isToWatch = isToWatch
    }
}



let DunePartTwo = MovieDetails(name: "Dune: Part Two", year: "2024", isToWatch: true)
