//
//  Extension.swift
//  Github
//
//  Created by jewelz on 2017/3/29.
//  Copyright © 2017年 jewelz. All rights reserved.
//

import UIKit
import ImageIO

extension UIImageView {
    
    func gif(named: String) {
        image = UIImage.animageGIF(named: named)
    }
}

extension UIImage {
    
    /// Create image with gif data
    static func animatedGIF(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        var animatedImage: UIImage?
        
        let count = CGImageSourceGetCount(source)
        if count <= 1 {
            animatedImage = UIImage(data: data)
        }
        else {
            var images = [UIImage]()
            
            var duration = 0.0
            
            for i in 0 ..< count {
                let image = CGImageSourceCreateImageAtIndex(source, i, nil)
                
                //duration = duration
                images.append(UIImage(cgImage: image!, scale: UIScreen.main.scale, orientation: .up))
            }
            
            duration = (1 / 10) * Double(count)
            
            print("duration: \(duration), \(count)")
            
            animatedImage = UIImage.animatedImage(with: images, duration: duration)
            
        }
        
        return animatedImage
    }
    
    /// Create image with gif file name
    /// - Parameter named: name of the gif 
    /// - Returns: The image created by gif fle name
    static func animageGIF(named: String) -> UIImage? {
       
        guard let url = Bundle.main.url(forResource: named, withExtension: ".gif") else {
            return nil
        }
        
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        
        return animatedGIF(data: data)
    }
    
}
