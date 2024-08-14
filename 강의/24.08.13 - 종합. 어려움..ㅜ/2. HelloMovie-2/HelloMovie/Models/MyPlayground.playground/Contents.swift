import UIKit
import HelloMovie

var movies: [Movie] = MovieStore.shared.movies

var filteredMovies = movies.filter { movie in
    if movie.publisher == .cjEnm {
        return true
    } else {
        return false
    }
}

filteredMovies = movies.filter { $0.publisher == .cjEnm }.sorted { $0.year > $1.year }

print(filteredMovies.count)


for publisher in Publisher.allCases {
    print("\(publisher.rawValue)")
}
