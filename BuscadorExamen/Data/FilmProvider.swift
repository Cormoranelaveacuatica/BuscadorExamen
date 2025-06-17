//
//  FilmProvider.swift
//  BuscadorExamen
//
//  Created by Mañanas on 17/6/25.
//

import Foundation

class FilmProvider {
    
    static let API_KEY = "fb7aca4"
    
    static func findFilmsByName(query: String) async -> [Film] {
        let url = URL(string: "https://www.omdbapi.com/?apikey=\(API_KEY)&s=\(query)")
        
        guard let url = url else {
            print("Error building URL")
            return []
            
        }
        do {
            let (data, response) = try await URLSession.shared.data (from: url)
            let result = try JSONDecoder().decode(FilmResponse.self, from: data)
            return result.Search
        } catch {
            print(error)
            return []
        }
    }
    static func findFilmByID(query: String) async -> Film? {
        let url = URL(string: "https://www.omdbapi.com/?apikey=\(API_KEY)&i=\(query)")
        
        guard let url = url else {
            print("Error building URL")
            return nil
            
        }
        do {
            let (data, response) = try await URLSession.shared.data (from: url)
            let result = try JSONDecoder().decode(Film.self, from: data)
            return result
        } catch {
            print(error)
            return nil
        }
    }
}
