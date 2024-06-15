//
//  GPTGetterView.swift
//  Filmy
//
//  Created by Nikita Zhdanov on 2024-06-14.
//

import OpenAI
import SwiftUI


// VIEW
struct RecomendationsGetterView: View {
    
    // MARK: Stored properties
    
    // Receives arrays with user's preferences
    @State private var didLike: [MovieDetails] = [DunePartTwo, Interstellar]
    @State private var didNotLike: [MovieDetails] = [Batman]
    
    
    // The response from ChatGPT
    @State private var response: String? = nil
    @State private var movieSuggestion: [MovieDetails] = []
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    
                    
                    Text("The movies that you liked")
                        .bold()
                        .font(.title3)
                    // Show the movies the user has liked/disliked
                    List(didLike) { movie in
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .bold()
                            Text(movie.date_released)
                                .font(.subheadline)
                        }
                    }
                    .listStyle(.plain)
                    .frame(height: 200)
                    
                    // Allow user to ask for movie recommendations
                    Button {
                        Task {
                            response = try await getMovieRecommendations()
                        }
                    } label: {
                        Text("Get Movie Recommendations")
                    }
                    .buttonStyle(.borderedProminent)
                    
                    // Only show the text view when there is a response...
                    if let response = response {
                        
                        Group {
                            Text("Here are some new movies you might enjoy...")
                            
                            // Show the movie recommendations
                            List(movieSuggestion) { movie in
                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .bold()
                                    Text(movie.date_released)
                                        .font(.subheadline)
                                }
                            }
                            .listStyle(.plain)
                            .frame(height: 200)
                        }
                    }
                    
                    Spacer()
                    
                }
                .padding()
            }
            .navigationTitle("Fancy Test")
        }
        .onChange(of: response) {
            // When there is a non-nil response from ChatGPT, decode it into an array of suggestions
            // NOTE: This is a good reference for tips on encoding and decoding JSON
            //       https://www.swiftyplace.com/blog/codable-how-to-simplify-converting-json-data-to-swift-objects-and-vice-versa
            if let response = response {
                
                let decoder = JSONDecoder()
                do {
                    
                    // Turn the string into an instanc of the Data type (required to decode from JSON)
                    let data = Data(response.utf8)
                    
                    // Try to decode ChatGPT's response into an array of movie suggestions
                    movieSuggestion = try decoder.decode([MovieDetails].self, from: data)
                    
                } catch {
                    debugPrint(error)
                }
                
            }
        }
    }
    
    // MARK: Functions
    private func getMovieRecommendations() async throws -> String? {
        
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
        
        // NOTE: See Mr. Gordon to obtain your API key.
        //
        //       Add a file named Secrets.swift to a Helpers group in your project.
        //       The file must be named exactly as shown.
        //       Define a constant named like this that includes the apiKey you were provided with:
        //
        //       let apiKey = "REPLACE_WITH_YOUR_API_KEY"
        //
        let openAI = OpenAI(apiToken: apiKey)
        
        // Define the overall question preamble
        let questionPreamble = """
                    Hi, I will give a number of movies that I recently watched in the JSON format, with eleven name-value pairs describing each movie in detail. I will provide 2 arrays: the ones I liked and did not like. After examining them could you please give me a recomendation of a 2 movies I should watch based on my preferences.
                    
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
                    Please include only the JSON structure in your response, with no other text before or after your reply.
                    
                    When providing JSON structure, please make the following variables having the following values:
                    "status: "Not watched", isInLibrary: false, userLiked: false"
                    
                    """
        
        // Assemble the entire question
        let question = questionPreamble + likedMoviesPreamble + notLikedMoviesPreamble + questionConclusion
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
            return result.choices.first?.message.content?.string ?? nil
        } catch {
            debugPrint(error)
        }
        
        // Shouldn't ever get here, but a return statement to satisfy the Swift compiler
        return nil
        
    }
    
}

#Preview {
    RecomendationsGetterView()
}
