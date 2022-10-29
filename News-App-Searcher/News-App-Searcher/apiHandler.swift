import Foundation


struct Constants {
    static let baseURL = URL(string: "https://newsapi.org/v2/everything?q=keyword&apiKey=00b05f9e03cc4b958e462fcfe0608879")
}

final class ApiHandler {
    
    
    static let shared = ApiHandler()
    
    
    
    private init() {
        
    }
    
    public func getAllNews(completionHandlers: @escaping (Result<[String], Error>) -> Void) {
        guard let url = Constants.baseURL else {
            return
        }
        let tasker = URLSession.shared
        let apiCall = tasker.dataTask(with: url) { data , response, wrongCall in
            
            if let error = wrongCall {
                completionHandlers(.failure(error))
            } else if let data = data {
                
                do {
                    let result = try JSONDecoder().decode(ApiDataResponse.self, from: data)
                    print("Articles: \(result.articles.count)")
                }
                catch{
                    completionHandlers(.failure(error))
                }
            }
            
        
            
        }
        
        apiCall.resume()
        
        
    }
    
    
}
