//
//  BaseViewController.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 1/7/21.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func addPlayerViewFrom(_ id:String){
        
        guard let showVideoViewController = UIStoryboard(name: ShowVideoViewController.key, bundle: nil).instantiateViewController(withIdentifier: ShowVideoViewController.key) as? ShowVideoViewController else {
            fatalError("Failed to load storyboard")
        }
        
        showVideoViewController.videoId = id
        
        self.present(showVideoViewController, animated: true, completion: nil)
    }
    
    func hideKeyBoard(){
        view.endEditing(true)
    }
    
}

