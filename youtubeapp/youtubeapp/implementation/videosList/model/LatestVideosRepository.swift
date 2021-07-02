//
//  LatestVideosRepository.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//

import Foundation


class LatestVideosRepository:BaseRepository {
    
    override init(){}
    
    public static let shared = LatestVideosRepository()
    
    public func getLatestVideos(completionHandler: @escaping (String?) -> Void) -> () {
         
        let url = "\(Constants.web.youtubeV3)/videos?part=snippet%2CcontentDetails&regionCode=CO&chart=mostPopular&maxResults=50&key=\(Constants.web.youtubeKEY)"
        
        callGetWebService(url: url){
            (response)in
            completionHandler(response)
        }
    }
    
    public func getVideosByWord(word:String,completionHandler: @escaping (String?) -> Void) -> () {
         
        let url = "\(Constants.web.youtubeV3)/search?part=snippet&regionCode=CO&maxResults=50&q=\(word)&type=video&key=\(Constants.web.youtubeKEY)"
        
        callGetWebService(url: url){
            (response)in
            completionHandler(response)
        }
        
    }
    
    private func callGetWebService(url:String,completionHandler: @escaping (String?) -> Void) -> () {
        self.requestGET(url:url){
            (response)in
            if let responseData =  response as? String {
                completionHandler(responseData)
            }else{
                completionHandler(nil)
            }
        }
    }
}
