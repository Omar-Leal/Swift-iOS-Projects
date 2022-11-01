
import Foundation

struct ApiDataResponse: Codable {
    let articles: [ ArticleTypes ]
}


struct ArticleTypes: Codable {
   let source: Source
   var title: String
   var description: String?
   var url: String
   var urlToImage: String?
   var publishedAt: String

    
}

struct Source: Codable {
    let name: String
    
}
