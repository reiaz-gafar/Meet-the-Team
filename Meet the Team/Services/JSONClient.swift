//
//  JSONClient.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import Foundation

// MARK: - Custom Error For JSONClient
enum JSONError: Error {
    case unableToFindFile
}

struct JSONClient {
    
    //MARK: - Static Functions
    static func loadData(completion: @escaping (Data?, Error?) -> Void) {
        if let path = Bundle.main.path(forResource: "team", ofType: "json") {
            let jsonURL = URL(fileURLWithPath: path)
            do {
                let data = try Data(contentsOf: jsonURL)
                completion(data, nil)
                return
            } catch {
                completion(nil, error)
                return
            }
        } else {
            completion(nil, JSONError.unableToFindFile)
            return
        }
    }
    
    static func parseJSON(completion: @escaping ([Member]?, Error?) -> Void) {
        loadData { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let members = try decoder.decode([Member].self, from: data)
                    completion(members, nil)
                    return
                } catch {
                    completion(nil, error)
                    return
                }
            }
        }
    }
    
}
