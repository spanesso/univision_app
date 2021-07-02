//
//  ViewController.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 29/6/21.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let favoritesImage = UIImage(systemName: "star")
        let videosViewController = addVideosViewController(title: Constants.navitagion.featured, image: favoritesImage!, type: .FILTER)
        
        let searchImage = UIImage(systemName: "magnifyingglass")
        let videosSearchedViewController = addVideosViewController(title: Constants.navitagion.search, image: searchImage!, type: .SEARCH)
       
        self.setViewControllers([videosViewController,videosSearchedViewController], animated: true)
    }
    
    private func addVideosViewController(title:String,image:UIImage,type:TypeView)->VideosViewController{
        guard let videosViewController = UIStoryboard(name: VideosViewController.key, bundle: nil).instantiateViewController(withIdentifier: VideosViewController.key) as? VideosViewController else {
            fatalError("Failed to load storyboard")
        }
        videosViewController.title = title
        videosViewController.tabBarItem.image = image
        videosViewController.viewType = type
        
        return videosViewController
    }
        
}

