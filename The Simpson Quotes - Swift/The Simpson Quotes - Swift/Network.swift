import Foundation




struct Constants {
    static let apiUrl = URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes")
}

struct QuoteModel: Decodable {
    let quote: String
    let character: String
    let image: String
    let characterDirection: String
    
}

protocol ApiDelegate {
    func update(quotes: [QuoteModel])
}

class QuotesManager {
    
    var delegate: ApiDelegate?
    
    
    
    func callApi(){
        
        guard let urlEndpoint = Constants.apiUrl else { return }
        
        let urlSession = URLSession.shared.dataTask(with: urlEndpoint, completionHandler: { data, _ , error in
            print("we pass??")
           // guard let err = error else { return }
            let results = try! JSONDecoder().decode([QuoteModel].self, from: data!)
    
            // Passing the results data into the delegate
            self.delegate?.update(quotes: results)
        })
        
        urlSession.resume()
    }
}
