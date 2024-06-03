//
//  Movie.swift
//  DZ_2_modul3
//
//  Created by Nikita Shipovskiy on 03/06/2024.
//

import Foundation

struct TrendingMoviesResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let countries: [String]
    
    let genres: [String]

    let imdbId: String?
    let kinopoiskId: Int
    let nameEn: String?
    let nameOriginal: String?
    let nameRu: String
    let posterUrl: String
    let posterUrlPreview: String
    let ratingImdb: Double?
    let ratingKinopoisk: Double?
    let type: String?
    let year: Int
}

//            {
//        countries =             (
//                            {
//                country = "\U041a\U043e\U0440\U0435\U044f \U042e\U0436\U043d\U0430\U044f";
//            }
//        );
//        genres =             (
//                            {
//                genre = "\U043c\U0443\U0437\U044b\U043a\U0430";
//            },
//                            {
//                genre = "\U043a\U043e\U0440\U043e\U0442\U043a\U043e\U043c\U0435\U0442\U0440\U0430\U0436\U043a\U0430";
//            }
//        );
//        imdbId = "<null>";
//        kinopoiskId = 1201206;
//        nameEn = "<null>";
//        nameOriginal = "BTS: Blood Sweat & Tears";
//        nameRu = "<null>";
//        posterUrl = "https://kinopoiskapiunofficial.tech/images/posters/kp/1201206.jpg";
//        posterUrlPreview = "https://kinopoiskapiunofficial.tech/images/posters/kp_small/1201206.jpg";
//        ratingImdb = "<null>";
//        ratingKinopoisk = "9.4";
//        type = VIDEO;
//        year = 2016;
//    },
