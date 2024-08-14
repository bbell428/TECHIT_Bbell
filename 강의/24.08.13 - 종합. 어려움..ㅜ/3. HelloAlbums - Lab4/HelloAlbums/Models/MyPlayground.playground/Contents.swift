import UIKit
import HelloAlbums


for publisher in Publisher.allCases {
    print("\(publisher.rawValue)")
}


var albums: [Album] = AlbumStore.shared.albums

var filteredAlbums = albums.filter { album in
    if album.publisher == .KJH {
        return true
    } else {
        return false
    }
}

filteredAlbums = albums.filter { $0.publisher == .BMS }.sorted { $0.name > $1.name }

print(filteredAlbums.count)



for album in filteredAlbums {
    print(album.posterURL ?? "(none)")
    
    if let urlString = album.posterURL {
        Task {
            do {
                let image: UIImage = try await UIImage.fetchImage(from: urlString)
                print(image)
            } catch {
                
            }
        }
    }
}

