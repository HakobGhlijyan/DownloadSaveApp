//
//  ImageLoadingViewModel.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 26.07.2023.
//

import SwiftUI
import Combine

class ImageLoadingViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading:Bool = false
    
    //url for image - > send is other ViewModel
    let urlString: String
    
    // key for image -> get Inage Funcs
    let imageKey: String
    
    //MARK: - Cancellables - .store
    var cancellables = Set<AnyCancellable>()
    
    init(url:String, key:String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    //MARK: - MANAGER 2 TYPE
    //1                                                             -- SAVE i kajdiy raz zagrujat v cache
//    let manager = PhotoModelCacheManager.instance
    //2                                                             -- Save v file manager e i ne nujno v sleduychy raz zagrujat
    let manager = PhotoModelFileManager.instance
    
    //MARK: - Get IMAGE IS managerCache and managerFiles
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting SAVED IMAGE!!")
        } else {
            downloadImage()
            print("Downloading image NOW!!")

        }
    }
    
    //MARK: - DOWNLOAD Image (Combine)
    func downloadImage() {
        // Make isLoading
        isLoading = true
        //url
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        //Publisher
        URLSession.shared.dataTaskPublisher(for: url)
        //add image $0 in data
            .map { UIImage(data: $0.data) }
        //make is main threads - potok
            .receive(on: DispatchQueue.main)
        //sink - sinxronizaciya
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] (returnedImage) in
                guard
                    let self = self,
                    let image = returnedImage else { return }
                // add image
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)
    }
}
