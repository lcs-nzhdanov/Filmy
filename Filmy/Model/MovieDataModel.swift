//
//  MovieDataModel.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-30.
//

import Foundation

// Convert minutes into "xh xm"
func minutesToHours(lengthMinutes: Int) -> String {
    let hours: Int = lengthMinutes / 60
    let minutes: Int = lengthMinutes % 60
    
    return (minutes == 0 ? "\(hours)h": "\(hours)h \(minutes)m")
}


// Convert list into String with commas in between
func listToString(list: [String]) -> String {
    return list.joined(separator: ", ")
}



@Observable
class MovieDetails {
    let id = UUID()
    
    let title: String
    let duration_m: Int
    let date_released: String
    let budget: Int
    let description: String
    var platformsToWatch: [String]
    let actorsInvolved: [String]
    
    var status: String
    var isToWatch: Bool
    var userLiked: Bool
    
    
    
    init(title: String, duration_m: Int, date_released: String, budget: Int, description: String, platformsToWatch: [String], actorsInvolved: [String], status: String, isToWatch: Bool, userLiked: Bool) {
        self.title = title
        self.duration_m = duration_m
        self.date_released = date_released
        self.budget = budget
        self.description = description
        self.platformsToWatch = platformsToWatch
        self.actorsInvolved = actorsInvolved
        self.status = status
        self.isToWatch = isToWatch
        self.userLiked = userLiked
    }
}


@Observable
class movieSuggestion {
    var mainMovie: MovieDetails
    
    var movieIfNo: MovieDetails
    
    var movieIfYes: MovieDetails
    
    init(mainMovie: MovieDetails, movieIfNo: MovieDetails, movieIfYes: MovieDetails) {
        self.mainMovie = mainMovie
        self.movieIfNo = movieIfNo
        self.movieIfYes = movieIfYes
    }
}
    

var DunePartTwo = MovieDetails(title: "Dune: Part Two", duration_m: 166, date_released: "2024", budget: 190000000, description: "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he must prevent a terrible future only he can foresee.", platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Zendaya", "Timothee Chalet"], status: "Not wathced", isToWatch: false, userLiked: false)

var Batman = MovieDetails(title: "Batman", duration_m: 142, date_released: "2023", budget: 113400000, description: "Some description", platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Batman", "Joker"], status: "Not wathced", isToWatch: false, userLiked: false)

var Interstellar = MovieDetails(title: "Interstellar", duration_m: 194, date_released: "2014", budget: 120000000, description: "Some description", platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Cosmonaut", "Tony Stark"], status: "Not wathced", isToWatch: false, userLiked: false)
    
    

var moviesList: [MovieDetails] = [DunePartTwo, Batman, Interstellar, DunePartTwo, Batman, Interstellar, DunePartTwo, Batman, Interstellar]

var suggestedMovies = movieSuggestion(mainMovie: DunePartTwo, movieIfNo: Batman, movieIfYes: Interstellar)
