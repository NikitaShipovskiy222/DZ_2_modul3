//
//  APICaller.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 02/06/2024.
//

import Foundation


protocol Network: AnyObject {
    var url: URL? {get set}
    var requeset: URLRequest? {get set}
    func sendRequest(complition: @escaping (String) -> Void)
}

class APICaller: Network {

    

    static let  shared = APICaller()
    var url: URL?
    var requeset: URLRequest?
    
    func sendRequest(complition: @escaping (String) -> Void) {
       // application/json
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "kinopoiskapiunofficial.tech"
        urlComponents.path = "/api/v2.2/films"
        
        
        self.url = urlComponents.url
        
        if let url = url {
            requeset = URLRequest(url: url)
            requeset?.httpMethod = "GET"
            requeset?.setValue("b7659ec1-921b-4ad2-a568-b32ba2e3df61", forHTTPHeaderField: "x-api-key")
            requeset?.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
//            let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
            URLSession.shared.dataTask(with: requeset!) { data, responsce, err in
                guard let data = data, err == nil else {
                    print(err!.localizedDescription)
                    return
                }
                print(data)
                
                do {
                   let result = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                    /*try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)*/
                    print(result)
                }catch{
                    print(err!.localizedDescription)
                }
            }.resume()
        }
        
    }
    
//https://kinopoiskapiunofficial.tech/api/v2.2/films/30
    
//    func getTredingMovies(complition: @escaping (String) -> Void) {
//        guard let url = URL(string: "\(Constant.basecURL)/v1.4/movie/20") else {return}
//    }
//    
}
//curl -X 'GET' \
//  'https://api.kinopoisk.dev/v1.4/movie/20' \
//  -H 'accept: application/json' \
//  -H 'X-API-KEY: 6P0VQGQ-871MQ83-KNB6W6Q-JF38WHR'
