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
    let title: String
    let duration_m: Int
    let date_released: String
    let budget: Int
    let description: String
    var platformsToWatch: Array<Any>
    let actorsInvolved: Array<Any>
    
    var status: String
    var isToWatch: Bool
    
    
    
    init(title: String, duration_m: Int, date_released: String, budget: Int, description: String, platformsToWatch: Array<Any>, actorsInvolved: Array<Any>, status: String, isToWatch: Bool) {
        self.title = title
        self.duration_m = duration_m
        self.date_released = date_released
        self.budget = budget
        self.description = description
        self.platformsToWatch = platformsToWatch
        self.actorsInvolved = actorsInvolved
        self.status = status
        self.isToWatch = isToWatch
    }
}



let DunePartTwo = MovieDetails(title: "Dune: Part Two", duration_m: 166, date_released: "2024", budget: 190000000, description: "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he must prevent a terrible future only he can foresee.", platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Zendaya", "Timothee Chalet"], status: "Not wathced", isToWatch: false)


