//
//  YoutubeVideo.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//

import Foundation

struct YoutubeVideo: Decodable {

    let kind: String?
    let etag: String?
    let id: String?
    let snippet: Snippet?
 
}


struct YoutubeSearchdVideo: Decodable {

    let kind: String?
    let etag: String?
    let id: YoutubeIdVideo?
    let snippet: Snippet?
 
}


struct YoutubeIdVideo: Decodable {

    let kind: String?
    let videoId: String?
 
}

struct Snippet: Decodable {

    let publishedAt: String?
    let title: String?
    let description: String?
    let thumbnails: ThumbnailList?
}

struct ThumbnailList: Decodable {

    let high: Thumbnail?
    let standard: Thumbnail?
    let maxres: Thumbnail?
}

struct Thumbnail: Decodable {

    let url: String?
    let width: Int?
    let height: Int?
}


