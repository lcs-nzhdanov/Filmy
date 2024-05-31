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
    let length: String
    let year: String
    
    var isToWatch: Bool
    
    
    
    init(name: String, length: String, year: String, isToWatch: Bool) {
        self.name = name
        self.length = length
        self.year = year
        self.isToWatch = isToWatch
    }
}



let DunePartTwo = MovieDetails(name: "Dune: Part Two", length: minutesToHours(lengthMinutes: 166), year: "2024", isToWatch: true)
