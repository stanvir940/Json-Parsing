//
//  APIService.swift
//  For-json
//
//  Created by Tanvir Ahmed on 18/12/24.
//

import Foundation


class APIService {
    static let shared = APIService() // Singleton instance
    
    func fetchImgs(completion: @escaping (Result<[Img], Error>) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            do {
                let imgs = try JSONDecoder().decode([Img].self, from: data)
                completion(.success(imgs))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }

}

// Optional: Enum for network errors
enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
