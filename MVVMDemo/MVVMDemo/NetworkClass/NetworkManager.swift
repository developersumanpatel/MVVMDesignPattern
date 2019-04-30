//
//  File.swift
//  MVVMDemo
//
//  Created by Suman on 16/04/19.
//  Copyright © 2019 Suman. All rights reserved.
//

import Foundation
typealias CompletionBlock = (_ success: Bool, _ response: Any?) -> Void

class NetworkManager {
    static let shared = NetworkManager()
    func callGetApI(url: URL, completion: @escaping CompletionBlock) {
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard error == nil else {
                completion(false, error?.localizedDescription)
                return
            }
            
            guard let content = data else {
                completion(false, "No data")
                return
            }

            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                completion(false, "Not containing JSON")
                return
            }
            completion(true, json)
        }
        task.resume()
    }
}
