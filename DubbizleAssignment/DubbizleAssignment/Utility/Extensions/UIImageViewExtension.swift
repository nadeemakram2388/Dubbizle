//
//  UIImageViewExtension.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/22/20.
//

import Foundation
import UIKit

extension UIImageView {
    func setCorner(_ corner: CGFloat) {
        layer.cornerRadius = corner
        layer.masksToBounds = true
    }
}

extension UIImageView {
    
    func loadImage(url: URL, placeHolder: UIImage?, showProgress: Bool = true, completion: @escaping ((_ image: UIImage)->Void)) {
        self.loadImage(url: url, placeHolder: placeHolder, showProgress: showProgress) { (image, fromCache) in
            completion(image)
        }
    }
    
    func loadImage(url: URL, placeHolder: UIImage?, showProgress: Bool = true, completion: @escaping ((_ image: UIImage, _ fromCache: Bool )->Void)) {
        
        self.layoutIfNeeded()

        if let imgData = FileCache.sharedCache.getDataFromCache(path: url.absoluteString), let img = UIImage(data: imgData) {
                self.image = img
                completion(img, true)
        } else {
            self.image = placeHolder
            var spinnerView: CircleProgressView?
            if showProgress, self.bounds.size.width > 100 && self.bounds.size.height > 100 {
                let spinner = CircleProgressView(frame: CGRect(x: self.bounds.size.width/2, y: self.bounds.size.height/2, width: 25, height: 25))
                spinnerView = spinner
                self.addSubview(spinner)
                spinner.addCircleProgress()
            }

            let session = URLSession(configuration: URLSessionConfiguration.default)
            session.dataTask(with: url, completionHandler: { (response, data, error) in
                DispatchQueue.main.async(execute: { () -> Void in
                    spinnerView?.stopProgressAnimation()
                    
                    if let response = response, let image = UIImage(data: response) {
                        if url.pathExtension == "png", let data = image.pngData() {
                            FileCache.sharedCache.addToCache(path: url.absoluteString, data: data)
                        } else if let data = image.jpegData(.lowest) {
                            FileCache.sharedCache.addToCache(path: url.absoluteString, data: data)
                        }
                        completion(image, false)
                    }
                    session.finishTasksAndInvalidate()
                })
            }).resume()
        }
    }    
}

extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpegData(_ jpegQuality: JPEGQuality) -> Data? {
        return jpegData(compressionQuality: jpegQuality.rawValue)
    }
}
