import Foundation


struct NewsArticlesTypes: Codable {
    let articles: [ ArticlesTypes ]
}

struct ArticlesTypes: Codable {
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

struct Constant {
    static let apiURL = URL(string: "https://newsapi.org/v2/everything?q=keyword&apiKey=00b05f9e03cc4b958e462fcfe0608879")
}

final class FetchNews {
    
    static let shared = FetchNews()
    
    private init(){}
    
    public func getAllNewsRow(completion: @escaping (Result<[ArticlesTypes], Error>) -> Void) {
        guard let url = Constant.apiURL else {
            return
        }
        
        let tasker = URLSession.shared
        let calling = tasker.dataTask(with: url) { data, _ , Wrong in
            if let error = Wrong {
                completion(.failure(error))
            } else if let response = data {
                do {
                    let results = try JSONDecoder().decode(NewsArticlesTypes.self, from: response)
                    completion(.success(results.articles))
                } catch {
                    completion(.failure(error))
                }
            }
            
        }
        calling.resume()
    }
    
    
}



