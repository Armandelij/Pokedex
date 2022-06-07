//
//  Helpers.swift
//  Pokedex
//
//  Created by Elijah Armande on 6/4/22.
//

import Foundation
//MARK: - The 2 functions below decodes static JSON and live JSON data from the internet

extension Bundle { // we can call theses functions on any file we need to 
    //MARK: - func decode() decodes normal JSON within a bundle

    func decode<T:Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not locate \(file) in bundle.")
        }
        
        guard let  data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
    
    //MARK: - func fetchData() fetches the data and decodes it.
    func fetchData<T: Decodable>(url: String, model: T.Type, completion:@escaping(T) -> (), failure: @escaping(Error) -> ()) {
        guard let url = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                if let error = error {
                    failure(error)
                }
                return
            }
            
            do {
                let serverData = try JSONDecoder().decode(T.self, from: data)
                completion(serverData)
            } catch {
                failure(error)
            }
        }
        .resume()
    }
}
