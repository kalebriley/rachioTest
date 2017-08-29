//
//  NetworkingClient.swift
//  Rachio
//
//  Created by kaleb riley on 8/28/17.
//  Copyright © 2017 Kaleb Riley. All rights reserved.
//

import Foundation

public protocol TargetType {
    var route: String {get}
}

public enum Result {
    public typealias JSON = [String: Any?]
    
    case success(JSON)
    case failure(Error)
}

public final class NetworkClient {
    // NOTE: this token should be set by authentication but is set manually here.
    private var bearerToken = "Bearer 599c4261-103d-4e9a-b5c4-06558c7fcbe9"
    
    // MARK: - Instance Properties
    internal let baseURL: URL
    internal let session = URLSession.shared
    
    // MARK: - Class Constructors
    public static let shared: NetworkClient = {
        let file = Bundle.main.path(forResource: "ServerEnvironments", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: file)!
        let urlString = dictionary["service_url"] as! String
        let url = URL(string: urlString)!
        return NetworkClient(baseURL: url)
    }()
    
    // MARK: - Object Lifecycle
    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public func request(target: TargetType, completion: @escaping (Result) -> Void) {
        let url = baseURL.appendingPathComponent(target.route)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        print(urlRequest.value(forHTTPHeaderField: "Authorization") ?? "Not set")
        
        let task = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode.isSuccessHTTPCode,
                let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data),
                let json = jsonObject as? [String: Any?] else {
                    if let error = error {
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    } else {
                        let error = NSError(domain: response?.url?.absoluteString ?? "", code: (response as! HTTPURLResponse).statusCode, userInfo: ["response": response!])
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                        
                    }
                    return
            }
            DispatchQueue.main.async {
                completion(.success(json))
            }
        })
        
        task.resume()
    }
}
