//
//  DownloadingImageView.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 26.07.2023.
//

import SwiftUI

struct DownloadingImageView: View {
    
    // Ex ImageLoadingViewModel
    @StateObject var loader: ImageLoadingViewModel
    
    /// Info
    /*
     @StateObject var loader = ImageLoadingViewModel()     -> zdesmi inicializiruem loader kak ImageLoadingViewModel()
     @StateObject var loader = ImageLoadingViewModel(url: <#String#>)
     url mojno budet bobavit i zdes , zdelav tak no ego nujno dobavit v samom init,pri init budem peredovat sam url
     @StateObject var loader: ImageLoadingViewModel        -> delaem loader delaem tipom ImageLoadingViewModel
     inicializiruem v samom init() , i chtob inicializirovat @StateObject v init() nujno dobavit ->  _loader
     _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url))  -> v takom vide
     */
     
    init(url:String, key:String) {
        _loader = StateObject(wrappedValue: ImageLoadingViewModel(url: url, key: key))
    }
    
    // In View I need all in make in loader
    var body: some View {
        ZStack {
            if loader.isLoading {
                ProgressView()
            } else if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .clipShape(Circle())
            }
        }
    }
}

struct DownloadingImageView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadingImageView(url: "https://via.placeholder.com/600/92c952", key: "1")
            .frame(width: 75, height: 75)
    }
}
