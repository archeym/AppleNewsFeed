//
//  NetworkManager.swift
//  RestCountriesApp
//
//  Created by Arkadijs Makarenko on 08/05/2023.
//

import Foundation


class NetworkManager {
    
    static let api = "https://newsapi.org/v2/everything?q=apple&from=2023-05-09&to=2023-05-12&sortBy=popularity&apiKey=1920b7f830414a5bb662b581372ff993"
    
    static func fetchData(url: String, completion: @escaping (NewsItems) -> () ) {

        guard let url = URL(string: url) else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true

        URLSession(configuration: config).dataTask(with: request) { (data, response, err ) in

            guard err == nil else {
                print("err:::::", err!)
                return
            }

            //print("response:", response as Any)

            guard let data = data else { return }


            do {
                let jsonData = try JSONDecoder().decode(NewsItems.self, from: data)
                completion(jsonData)
            }catch{
                print("err:::::", error)
            }

        }.resume()

    }
    
    
}
