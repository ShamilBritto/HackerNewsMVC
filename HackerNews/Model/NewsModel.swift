//
//  NewsModel.swift
//  HackerNews
//
//  Created by GGS-BKS on 10/01/23.
//

import Foundation

struct NewsModel : Decodable {
    var hits : [Hits]?
}

struct Hits : Decodable{
    var title : String?
    var URL : String?
    var point : Int?
}
