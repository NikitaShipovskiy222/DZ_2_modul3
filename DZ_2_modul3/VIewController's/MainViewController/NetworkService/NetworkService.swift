//
//  NetworkService.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 31/05/2024.
//

import Foundation


protocol NetworkProtocol: AnyObject {
    var url: URL? {get set}
    var request: URLRequest? {get set}
}

class NetworkService: NetworkProtocol {
    var url: URL?
//https://kinopoiskapiunofficial.tech/images/posters/kp/301.jpg
    
    var request: URLRequest?
    
    func sendRequset() {
        
        if let url = url {
            request = URLRequest(url: url)
        }
    }
}
