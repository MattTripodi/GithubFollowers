//
//  NetworkManager.swift
//  GithubFollowers
//
//  Created by Matthew Tripodi on 3/21/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.github.com"
    let perPage = 100
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completed: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUserName))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // If the error exists
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Cast response to an HTTPURLResponse and also check and make sure the response is a 200 status code
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                // This is what happens when response is something other than a 200 status code
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
