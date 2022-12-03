import Foundation

class NewArticleViewModel {
    let title: String
    let subtitle: String
    let imageURL: String?
    let imageData: Data? = nil
    
    init(title: String, subtitle: String, imageURL: String) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL

    }
    
    
    
}



