//
//  NewsModel.swift
//  News
//
//  Created by STARK on 13.05.2023.
//

struct News: Decodable {
    var results: [NewsResult]
}

struct NewsResult: Decodable {
    var title: String
    var abstract: String
    var multimedia: [NewsMultimedia]?
    var url: String //Bunu sor ???
    var subsection: String
}

struct NewsMultimedia: Decodable {
    let url: String
}

