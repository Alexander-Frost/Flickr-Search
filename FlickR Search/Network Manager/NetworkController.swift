//
//  NetworkController.swift
//  FlickR Search
//
//  Created by Alex on 2/8/20.
//  Copyright © 2020 Weekend. All rights reserved.
//

import UIKit

class NetworkController {
    
    // MARK: - Properties
    
    static let shared = NetworkController()
    
    static let errorMessage = "Something went wrong, Please try again later"
    static let noInternetConnection = "Please check your Internet connection and try again."
    
    // MARK: - Operations
    
    func request(_ request: Request, completion: @escaping (Result<Data>) -> Void) {
        
        guard (Reachability.currentReachabilityStatus != .notReachable) else {
            return completion(.Failure(NetworkController.noInternetConnection))
        }
        
        URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            guard error == nil else {return completion(.Failure(error!.localizedDescription))}
            guard let data = data else {return completion(.Failure(error?.localizedDescription ?? NetworkController.errorMessage))}
            guard let stringResponse = String(data: data, encoding: String.Encoding.utf8) else {return completion(.Failure(error?.localizedDescription ?? NetworkController.errorMessage))
            }
            print("Respone: \(stringResponse)")
            return completion(.Success(data))
        }.resume()
    }
    
    func downloadImage(_ urlString: String, completion: @escaping (Result<UIImage>) -> Void) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        
        guard let url =  URL.init(string: urlString) else {
            return completion(.Failure(NetworkController.errorMessage))
        }
        
        guard (Reachability.currentReachabilityStatus != .notReachable) else {
            return completion(.Failure(NetworkController.noInternetConnection))
        }
        
        session.downloadTask(with: url) { (url, reponse, error) in
            do {
                guard let url = url else {
                    return completion(.Failure(NetworkController.errorMessage))
                }
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    return completion(.Success(image))
                } else {
                    return completion(.Failure(NetworkController.errorMessage))
                }
            } catch {
                return completion(.Error(NetworkController.errorMessage))
            }
            }.resume()
    }
}
