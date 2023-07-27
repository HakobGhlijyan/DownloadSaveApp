//
//  DownloadingImagesViewModel.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 26.07.2023.
//

import SwiftUI
import Combine

class DownloadingImagesViewModel: ObservableObject {
    
    @Published var dataArray:[PhotoModel] = []
    
    //MARK: - Eexemple Singleton
    let dataService = PhotoModelDataService.instance
    
    //MARK: - Cancellables - .store
    var cancellables = Set<AnyCancellable>()

    init() {
        addSubcribers()
    }
    
    //MARK: - Subscribe photoModels in PhotoModelDataService
    func addSubcribers() {
        //subscribe publisher
        dataService.$photoModels
        //sink all data - send is [$photoModels] in [dataArray]
            .sink { [weak self] (returnedPhotoModel) in
                self?.dataArray = returnedPhotoModel
            }
        //save in cancellables
            .store(in: &cancellables)
    }
    
    
}
