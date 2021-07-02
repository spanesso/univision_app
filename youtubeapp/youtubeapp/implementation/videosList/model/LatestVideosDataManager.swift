//
//  LatestVideosDataManager.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//

import Foundation

class LatestVideosDataManager {
     
    private let repository = LatestVideosRepository.shared
    
    private init() {}
    
    public static let shared = LatestVideosDataManager()
    
    public func getLatestVideos(completionHandler: @escaping (String?) -> Void) -> () {
        self.repository.getLatestVideos(){
            (response)in
            completionHandler(response)
        }
    }
    
    public func getVideosByWord(word:String,completionHandler: @escaping (String?) -> Void) -> () {
        self.repository.getVideosByWord(word:word){
            (response)in
            completionHandler(response)
        }
    }
}
