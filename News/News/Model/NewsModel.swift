//
//  NewsModel.swift
//  News
//
//  Created by FurkanYıldırım on 13.05.2023.
//

struct News: Decodable {
    var results: [NewsResult]
}

struct NewsResult: Decodable {
    var title: String
    var abstract: String
    var multimedia: [NewsMultimedia]?
    var url: String
    var byline: String
    var section: String
}

struct NewsMultimedia: Decodable {
    let url: String
}

