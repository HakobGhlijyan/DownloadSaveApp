//
//  PhotoModelDataService.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 26.07.2023.
//

import SwiftUI
import Combine

class PhotoModelDataService {
    
    //MARK: - SINGLETON
    static let instance = PhotoModelDataService()
    
    //MARK: - This Array in add all PhotoModel - it's PUBLISHER
    @Published var photoModels:[PhotoModel] = []
    
    //MARK: - Cancellables - .store
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        downloadData()
    }
    
    //MARK: - DOWNLOAD DATA (Combine)
    func downloadData() {
        
        //MARK: - 1 url
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        //MARK: - 2 combine
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [PhotoModel].self, decoder: JSONDecoder())
            .sink { (complition) in
                switch complition {
                case .finished:
                    break
                case .failure(let error):
                    print("COMPLETION ERROR: \(error)")
                }
            } receiveValue: { [weak self] (returnedPhotoModel) in
                self?.photoModels = returnedPhotoModel
            }
            .store(in: &cancellables)
    }
    
    //MARK: - 3 func handleOutput
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
            guard
                let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
        return output.data
    }
}
