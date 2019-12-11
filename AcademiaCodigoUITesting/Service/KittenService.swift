//
//  KittenService.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation

class KittenService {

    static let shared = KittenService()

  private func createURLComponents(path: String) -> URLComponents {

           var componentURL = URLComponents()
           componentURL.scheme = "https"
           componentURL.host = "api.thecatapi.com"
           componentURL.port = 8080
           componentURL.path = path

           return componentURL
       }

    func getData(completion: @escaping (Result<[kitten], Error>) -> Void) {


        guard let validURL = createURLComponents(path: "/v1/images/search?limit=10&order=ASC&page=0&api_key=4aa9c458-5713-4a26-96ee-65c893d869cb").url else {
            print("URL not Valid.")
            return
        }


        URLSession.shared.dataTask(with: validURL) {
            (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("✅ API Status: \(httpResponse.statusCode) URL: \(validURL)")
            }

            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }

            do{
                let kittens = try JSONDecoder().decode([kitten].self, from: validData)

                completion(.success(kittens))
            }catch let serializationError {
                completion(.failure(serializationError))
            }
        }.resume()
    }
}
