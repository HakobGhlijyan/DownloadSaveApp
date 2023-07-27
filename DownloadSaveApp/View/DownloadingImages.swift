//
//  DownloadingImages.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 26.07.2023.
//

import SwiftUI

struct DownloadingImages: View {
    
    @StateObject var vm = DownloadingImagesViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.dataArray) { model in
                    //1
                    /*
                     HStack(spacing: 8.0) {
                         Circle()
                             .frame(width: 75, height: 75)
                         VStack(alignment: .leading) {
                             Text(model.title.capitalized)
                                 .font(.headline)
                             Text(model.url)
                                 .foregroundColor(.gray)
                                 .italic()
                         }
                         .frame(maxWidth: .infinity, alignment: .leading)
                     }
                     */
                    //2
                    DownloadingImagesRow(model: model)
                }
            }
            .navigationTitle("Downloading Images")
        }
    }
}

struct DownloadingImages_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImages()
    }
}
