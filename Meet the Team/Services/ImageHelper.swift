//
//  ImageHelper.swift
//  Meet the Team
//
//  Created by Reiaz Gafar on 6/14/18.
//  Copyright © 2018 Reiaz Gafar. All rights reserved.
//

import Foundation

import UIKit

enum ImageError: Error {
    case badUrl
    case badData
}

class ImageHelper {
    private init() {}
    static let manager = ImageHelper()
    
    private let imageCache = NSCache<NSString, UIImage>()
    
    private func addImage(with urlStr: String, and image: UIImage) {
        imageCache.setObject(image, forKey: urlStr as NSString)
    }
    
    private func getImage(with urlStr: String) -> UIImage? {
        return imageCache.object(forKey: urlStr as NSString)
    }
    
    
    public func getImage(from urlStr: String,
                         completion: @escaping (UIImage?, Error?) -> Void) {
        if let image = getImage(with: urlStr) {
            completion(image, nil)
            return
        } else {
            guard let url = URL(string: urlStr) else { completion(nil, ImageError.badUrl); return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(nil, error)
                } else if let data = data {
                    if let image = UIImage(data: data) {
                        self.addImage(with: urlStr, and: image)
                        completion(image, error)
                        return
                    } else {
                        completion(nil, ImageError.badData)
                    }
                }
            }.resume()
        }
    }
    
}
