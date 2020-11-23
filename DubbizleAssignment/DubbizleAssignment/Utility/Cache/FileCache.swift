//
//  FileCache.swift
//  DubbizleAssignment
//
//  Created by nadeem akram on 11/23/20.
//

import Foundation
class FileCache: NSObject {
    
    static let sharedCache: FileCache = FileCache()
    var tempFileCache: [String: Data] = [:]
    
    func updateTempFileCache(path: String, data: Data) {
        if tempFileCache[path] == nil {
            tempFileCache[path] = data
        }
    }
    
    func getCompleteUrlOfCachedData(path: String) -> URL? {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let basePath = paths.first {
            var baseURL = URL(fileURLWithPath: basePath, isDirectory: true)
            baseURL.appendPathComponent(path)
            return baseURL
        }
        return nil
    }
    
    func getDataFromCache(path: String) -> Data? {
        
        if let data = tempFileCache[path] {
            return data
        }else {
            let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            if let basePath = paths.first {
                var baseURL = URL(fileURLWithPath: basePath, isDirectory: true)
                baseURL.appendPathComponent(path)
                if FileManager.default.fileExists(atPath: baseURL.path){
                    if let data = try? Data(contentsOf: baseURL) {
                        updateTempFileCache(path: path, data: data)
                        return data
                    }
                }
            }
        }
        return nil
    }
    
    func addToCache(path: String, data: Data) {
        
        updateTempFileCache(path: path, data: data)

        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if let basePath = paths.first {
            
            var baseURL = URL(fileURLWithPath: basePath, isDirectory: true)
            baseURL.appendPathComponent(path)
            FileManager.default.createFile(atPath: baseURL.path, contents: data, attributes: nil)
            
            var urlComponents = baseURL.path.components(separatedBy: "/")
            urlComponents.removeLast()
            let dirURL = urlComponents.joined(separator: "/")
            try! FileManager.default.createDirectory(atPath: dirURL, withIntermediateDirectories: true, attributes: nil)
            do {
                // writes the image data to disk
                FileManager.default.createFile(atPath: baseURL.path, contents: data, attributes: nil)
                
                try data.write(to: baseURL)
            } catch {
                print("error saving file:", error)
            }
        }
    }
    
}
