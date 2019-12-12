//
//  KittenService.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation
import UIKit

class ProductService {

    static let shared = ProductService()

  private func createURLComponents(path: String) -> URLComponents {

           var componentURL = URLComponents()
           componentURL.scheme = "http"
           componentURL.host = "151.236.53.240"
           componentURL.port = 8080
           componentURL.path = path

           return componentURL
       }

    func getImages(subCategoryID: Int, completion: @escaping (Result<[Product], Error>) -> Void) {

        guard let validURL = createURLComponents(path: "/paodock/api/products/\(subCategoryID)").url else {
            print("URL not Valid.")
            return
        }

        URLSession.shared.dataTask(with: validURL) {
            (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("API Status: \(httpResponse.statusCode)")
                print("URL: \(validURL)")
            }

            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }

            do {
                let products = try JSONDecoder().decode([Product].self, from: validData)
                completion(.success(products))

                } catch let serializationError {
                    completion(.failure(serializationError))
                }
        }.resume()
    }
}
