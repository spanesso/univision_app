//
//  LatestVideoTableViewCell.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//

import Foundation
import UIKit


class LatestVideoCell: UITableViewCell {
    
    static let key = "LatestVideoCell"
    static let height = CGFloat(270.0)
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var more: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func loadData(video: YoutubeVideo){
   
        
        if let snippet = video.snippet,
           let videoUrl = video.snippet?.thumbnails?.high?.url {
            loadViewData(url: videoUrl, titleLabel: snippet.title!, moreLabel: snippet.description!)
        }

    }
    
    func loadSSearchedData(video: YoutubeSearchdVideo){
 
        if let snippet = video.snippet,
           let videoUrl = video.snippet?.thumbnails?.high?.url{
            loadViewData(url: videoUrl, titleLabel: snippet.title!, moreLabel: snippet.description!)
        }
         
    }
    
    func loadViewData(url:String,titleLabel:String,moreLabel:String){
        thumbnail.imageFromUrl(url)
        
        title.text = titleLabel
        more.text = moreLabel
        
        avatar.makeRounded()
        avatar.backgroundColor = .red
    }
 
}
