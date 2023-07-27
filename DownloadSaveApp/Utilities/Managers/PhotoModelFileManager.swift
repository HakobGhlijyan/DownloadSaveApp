//
//  PhotoModelFileManager.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 27.07.2023.
//

import SwiftUI

class PhotoModelFileManager {
    
    static let instance = PhotoModelFileManager()
    let folderName = "downloaded_photos"
    
    private init() {
        createFolderNeeded()
    }
    
    //MARK: - func make folder for image
    private func createFolderNeeded() {
        guard let url = getFolderPath() else { return }
        
        if !FileManager.default.fileExists(atPath: url.path) {
            do {
                try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
                print("Create Folder!")
            } catch let error {
                print("Error Create Folder: \(error.localizedDescription)")
            }
        }
    }
    
    //MARK: - folder PUTH
    private func getFolderPath() -> URL? {
        return FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(folderName)
    }
    
    //MARK: - ADD
    func add(key:String, value:UIImage) {
        guard
            let data = value.pngData(),
            let url = getImagePath(key: key) else { return }
        
        do {
            try data.write(to: url)
        } catch let error {
            print("Error Saving to File Manager \(error.localizedDescription)")
        }
    }
    
    // ..../downloaded_photos/
    // ..../downloaded_photos/image_name.png
    //MARK: - Add path image for ADD FUNC
    private func getImagePath(key: String) -> URL? {
        guard let folder = getFolderPath() else {
            return nil
        }
        return folder.appendingPathComponent(key + ".png")
    }
    
    //MARK: - GET
    func get(key:String) -> UIImage? {
        guard
            let url = getImagePath(key: key),
            FileManager.default.fileExists(atPath: url.path()) else {
            return nil
        }
        return UIImage(contentsOfFile: url.path())
    }
}
