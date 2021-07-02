//
//  ShowVideoViewController.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 1/7/21.
//

import Foundation
import UIKit

class ShowVideoViewController: UIViewController {
    static let key = "ShowVideo"
    var videoId:String!
    private var playerView: PlayerView!
    
    
    @IBAction func closeView(_ sender: Any) {
        playerView.stopVideo()
        dismiss(animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return .landscape
    }
    
    override var shouldAutorotate: Bool{
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerView = UINib(nibName: "PlayerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? PlayerView
        playerView.videoId = videoId!
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addPlayerView()
    }
    
    private func addPlayerView(){
 
        playerView.center = view.center
        playerView.alpha = 1
        playerView.transform = CGAffineTransform(scaleX: 0.8, y: 1.2)
        
        self.view.addSubview(playerView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [],  animations: {
            self.playerView.transform = .identity
        })
    }
    
    
    
}
