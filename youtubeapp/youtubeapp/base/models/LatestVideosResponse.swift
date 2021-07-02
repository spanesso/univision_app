//
//  LatestVideosResponse.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//

import Foundation

struct LatestVideosResponse: Decodable {

    let kind: String?
    let etag: String?
    let items: [YoutubeVideo]?

}



struct LatestVideosSearchedResponse: Decodable {

    let kind: String?
    let etag: String?
    let items: [YoutubeSearchdVideo]?

}

