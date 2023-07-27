//
//  ContentView.swift
//  DownloadSaveApp
//
//  Created by Hakob Ghlijyan on 26.07.2023.
//

// MARK: - WORKS
/*
 
 codable
 background threads
 weak self
 combine
 publishers and subscriber
 File Manager
 NSCache
 
 
 url - >
 
 https://jsonplaceholder.typicode.com/photos
 
 */
// JSON DATA Ex
/*
 
 [
   {
     "albumId": 1,
     "id": 1,
     "title": "accusamus beatae ad facilis cum similique qui sunt",
     "url": "https://via.placeholder.com/600/92c952",
     "thumbnailUrl": "https://via.placeholder.com/150/92c952"
   },
   {
     "albumId": 1,
     "id": 2,
     "title": "reprehenderit est deserunt velit ipsam",
     "url": "https://via.placeholder.com/600/771796",
     "thumbnailUrl": "https://via.placeholder.com/150/771796"
   },
   {
     "albumId": 1,
     "id": 3,
     "title": "officia porro iure quia iusto qui ipsa ut modi",
     "url": "https://via.placeholder.com/600/24f355",
     "thumbnailUrl": "https://via.placeholder.com/150/24f355"
   },
   {
     "albumId": 1,
     "id": 4,
     "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
     "url": "https://via.placeholder.com/600/d32776",
     "thumbnailUrl": "https://via.placeholder.com/150/d32776"
   },
   {
     "albumId": 1,
     "id": 5,
     "title": "natus nisi omnis corporis facere molestiae rerum in",
     "url": "https://via.placeholder.com/600/f66b97",
     "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
   }
 ]
 
 */

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            DownloadingImages()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
