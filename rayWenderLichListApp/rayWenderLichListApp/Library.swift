import class UIKit.UIImage
import Combine

class Library: ObservableObject {
  var sortedBooks: [Book] { booksCache }

    func addNewBook(_ book: Book , image: UIImage?) {
        booksCache.insert(book, at: 0)
        uiImages[book] = image
    }
  /// An in-memory cache of the manually-sorted books that are persistently stored.
  @Published private var booksCache: [Book] = [
    .init(title: "Ein Neues Land", author: "Shaun Tan", microReview: "test Review" ),
    .init(title: "Bosch", author: "Laurinda Dixon", microReview: "test Review" ),
    .init(title: "Dare to Lead", author: "Brené Brown", microReview: "test Review" ),
    .init(title: "Blasting for Optimum Health Recipe Book", author: "NutriBullet", microReview: "test Review" ),
    .init(title: "Drinking with the Saints", author: "Michael P. Foley", microReview: "test Review" ),
    .init(title: "A Guide to Tea", author: "Adagio Teas", microReview: "test Review" ),
    .init(title: "The Life and Complete Work of Francisco Goya", author: "P. Gassier & J Wilson", microReview: "test Review" ),
    .init(title: "Lady Cottington's Pressed Fairy Book", author: "Lady Cottington", microReview: "test Review" ),
    .init(title: "How to Draw Cats", author: "Janet Rancan", microReview: "test Review" ),
    .init(title: "Drawing People", author: "Barbara Bradley", microReview: "test Review" ),
    .init(title: "What to Say When You Talk to Yourself", author: "Shad Helmstetter")
  ]
    @Published var uiImages:[Book:UIImage] = [:]
}
