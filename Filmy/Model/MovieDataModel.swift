//
//  MovieDataModel.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-05-30.
//

import Foundation


@Observable
class MovieDetails: Identifiable {
    let id = UUID()
    
    let title: String
    let duration_m: Int
    let date_released: String
    let description: String
    let genres: [String]
    var platformsToWatch: [String]
    let actorsInvolved: [String]
    let imbdRating: Double
    
    var status: String
    var isInLibrary: Bool
    var userLiked: Bool
    
    
    
    init(title: String, duration_m: Int, date_released: String, description: String, genres: [String], platformsToWatch: [String], actorsInvolved: [String], imbdRating: Double, status: String, isInLibrary: Bool, userLiked: Bool) {
        self.title = title
        self.duration_m = duration_m
        self.date_released = date_released
        self.description = description
        self.genres = genres
        self.platformsToWatch = platformsToWatch
        self.actorsInvolved = actorsInvolved
        self.imbdRating = imbdRating
        self.status = status
        self.isInLibrary = isInLibrary
        self.userLiked = userLiked
    }
}
    

var DunePartTwo = MovieDetails(title: "Dune: Part Two", duration_m: 166, date_released: "2024", description: "Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family. Facing a choice between the love of his life and the fate of the universe, he must prevent a terrible future only he can foresee.", genres: ["Sci-fi", "Fantasy", "Drama", "Action"], platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Zendaya", "Timothee Chalet"], imbdRating: 9.3, status: "Not watched", isInLibrary: false, userLiked: false)

var Batman = MovieDetails(title: "Batman", duration_m: 142, date_released: "2023", description: "Some description", genres: ["Sci-fi", "Fantasy", "Drama", "Action"], platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Batman", "Joker"], imbdRating: 9.3, status: "Not watched", isInLibrary: false, userLiked: false)

var Interstellar = MovieDetails(title: "Interstellar", duration_m: 194, date_released: "2014", description: "Some description", genres: ["Sci-fi", "Fantasy", "Drama", "Action"], platformsToWatch: ["Netflix", "Disney", "PrimeVideo"], actorsInvolved: ["Cosmonaut", "Tony Stark"], imbdRating: 9.3, status: "Not watched", isInLibrary: false, userLiked: false)
    
    

var exampleMovies: [MovieDetails] = [DunePartTwo, Batman, Interstellar, DunePartTwo, Batman, Interstellar, DunePartTwo, Batman, Interstellar]
