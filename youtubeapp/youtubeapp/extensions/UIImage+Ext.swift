//
//  UIImage+Ext.swift
//  youtubeapp
//
//  Created by Sebastian Panesso on 30/6/21.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
    
    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
    
    func imageFromUrl(_ url: String) {
        let downloadURL = NSURL(string:url)!
        self.af_setImage(withURL: downloadURL as URL)
        self.contentMode = .scaleAspectFill
    }
}
