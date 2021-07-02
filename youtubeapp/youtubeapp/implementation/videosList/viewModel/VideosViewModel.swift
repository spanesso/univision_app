//
//  LatestVideosViewModel.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//


import Foundation
import RxSwift

class VideosViewModel {
    
    
    let dataManager = LatestVideosDataManager.shared
    var latestVideos = Variable<[YoutubeVideo]>([])
    var searchedVideos = Variable<[YoutubeSearchdVideo]>([])
    var cachedLatestVideos: [YoutubeVideo] = []
    
    
    
    init() {}
    
    func getLatestVideos() {
        dataManager.getLatestVideos(){
            (json)in
            
            if let videosJson = json as? String{
                if let videoList = self.parseToYoutubeVieoList(json:videosJson) as? [YoutubeVideo]{
                    self.cachedLatestVideos = videoList
                    self.latestVideos.value = videoList
                }
            }
        }
    }
    
    func parseToYoutubeVieoList(json:String)->[YoutubeVideo]?{
        let latestVideosResponse: LatestVideosResponse = try! JSONDecoder().decode(LatestVideosResponse.self, from: json.data(using: .utf8)!)
        return latestVideosResponse.items
    }
    
    
    func parseToYoutubeSearchedVieoList(json:String)->[YoutubeSearchdVideo]?{
        let latestVideosSearchedResponse: LatestVideosSearchedResponse = try! JSONDecoder().decode(LatestVideosSearchedResponse.self, from: json.data(using: .utf8)!)
        return latestVideosSearchedResponse.items
    }
  
    
    func filter(text: String) {
        if (text.count == 0) {
            latestVideos.value = cachedLatestVideos
        } else {
            
            let list = latestVideos.value.filter{($0.snippet?.title!.lowercased().contains(text.lowercased()))!}
  
            latestVideos.value = list.count > 0 ? list : cachedLatestVideos
        }
    }
    
    
    func searchByWord(text: String) {
        dataManager.getVideosByWord(word:text){
            (json)in
            if let videosJson = json as? String{
                if let videoList = self.parseToYoutubeSearchedVieoList(json:videosJson) as? [YoutubeSearchdVideo]{
                    self.searchedVideos.value = videoList
                }
            }
        }
    }
    
}
