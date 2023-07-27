//
//  PhotoModelCacheManager.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 27.07.2023.
//

import SwiftUI

class PhotoModelCacheManager {
    
    static let instance = PhotoModelCacheManager()
    private init() { }
    
    //MARK: - NSCACHE in load image in cache
    /*
     var photoCache: NSCache<AnyObject, AnyObject>  ->
     var photoCache: NSCache<NSString, UIImage> - i nujno ego inicializirovat
     var photoCache: NSCache<NSString, UIImage> = {
        //code
     }()
     */
    var photoCache: NSCache<NSString, UIImage> = {
        var cache = NSCache<NSString, UIImage>()
        cache.countLimit = 200
        cache.totalCostLimit = 1024 * 1024 * 200 // 200mb
        return cache
    }()
    
    //MARK: - ADD
    func add(key:String, value:UIImage) {
        photoCache.setObject(value, forKey: key as NSString)
    }
    
    //MARK: - GET
    func get(key:String) -> UIImage? {
        return photoCache.object(forKey: key as NSString)
    }
}
