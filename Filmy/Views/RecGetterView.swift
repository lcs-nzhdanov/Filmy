//
//  RecGetterView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-14.
//


import OpenAI
import SwiftUI

// Function to get movie recommendations
func getMovieRecommendations(didLike: [MovieDetails], didNotLike: [MovieDetails], moviesList: inout [MovieDetails]) async throws -> [MovieDetails]? {
    // Encode the list of movies to JSON
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    var likedListInJSON = ""
    var notLikedListInJSON = ""
    do {
        var jsonData = try encoder.encode(didLike)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            // DEBUG
            print("Movies the user has LIKED, encoded in JSON, are:")
            print("")
            print(jsonString)
            
            // Assign the encoded JSON to a variable we'll use later to build the question
            likedListInJSON = jsonString
        }
        
        jsonData = try encoder.encode(didNotLike)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            // DEBUG
            print("Movies the user did NOT LIKE and not liked, encoded in JSON, are:")
            print("")
            print(jsonString)
            
            // Assign the encoded JSON to a variable we'll use later to build the question
            notLikedListInJSON = jsonString
        }
        
    } catch {
        debugPrint(error)
        return nil
    }
    
    let openAI = OpenAI(apiToken: apiKey)
    
    // Define the overall question preamble
    let questionPreamble = """
                Hi, I will give a number of movies that I recently watched in the JSON format, with eleven name-value pairs describing each movie in detail. I will provide 2 arrays: the ones I liked and did not like. After examining them could you please give me a recomendation of 3 movies I should watch based on my preferences. This movie should be new and not exist in any of arrays I will provide.
                
                """
    
    // Define the liked movies preamble
    let likedMoviesPreamble = """
                
                I've watched these couple of movies recently and really enjoyed them.
                
                """
    
    // Define the not liked movies preamble
    let notLikedMoviesPreamble = """
                
                I've watched these movies recently and did not really like them.
                
                """
    
    // Define the question conclusion
    let questionConclusion = """
                
                Please include only the JSON structure in your response, with no other text before or after your reply. Respond using plain text and not a code format.
                
                When providing JSON structure, please make the following variables having the following values:
                "status: "Not watched", isInLibrary: false, userLiked: false"
                
                Once again, you MUST give only JSON in your response which will include the exact copy of properties from provided JSON earlier, the program functionability depends on this. Do not use any additional symbols, print only JSON in plain text with no code box.
                
                """
    
    // Assemble the entire question
    let question = questionPreamble + likedMoviesPreamble + likedListInJSON + notLikedMoviesPreamble + notLikedListInJSON + questionConclusion
    // DEBUG
    print("======")
    print(question)
    
    // Build the query
    let query = ChatQuery(
        messages: [ChatQuery.ChatCompletionMessageParam(
            role: .user,
            content: question
        )!],
        model: .gpt4_o
    )
    
    do {
        // Execute the query
        let result = try await openAI.chats(query: query)
        
        // DEBUG: What was the response?
        print("=====")
        print("Result from ChatGPT was...")
        print("")
        print(result)
        
        // Once query is received, return the response
        if let response = result.choices.first?.message.content?.string {
            let decoder = JSONDecoder()
            let data = Data(response.utf8)
            let movieSuggestion = try decoder.decode([MovieDetails].self, from: data)
            
            dump(movieSuggestion)
            print(movieSuggestion.count)
            
            moviesList += movieSuggestion
            print("COUNT AFTER ADDING A MOVIE ", moviesList.count)
            return movieSuggestion
        }
    } catch {
        debugPrint(error)
    }
    
    // Shouldn't ever get here, but a return statement to satisfy the Swift compiler
    return nil
}
