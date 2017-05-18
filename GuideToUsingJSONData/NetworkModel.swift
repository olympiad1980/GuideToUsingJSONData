import UIKit
import SwiftyJSON

struct Network {

    let author: String
    let title: String
    let urlToImage: String
    
    enum SerializationError: Error {
        
        case error(Error)
        case data(Data)
    }
}

class  NewsArticle {
    
    var network = [Network]()
    
    static let basePath = "https://newsapi.org/v1/articles?source=al-jazeera-english&sortBy=top&apiKey=4f3ad7637a534b788fcba09428886b62"
    func forecast(complection: @escaping ([Network], Error?) -> Void) {
        let url = NewsArticle.basePath
        let request = URLRequest(url: URL(string: url)!)
        URLSession.shared.dataTask(with: request) { (data: Data?, _, error: Error?) in
            
            guard let data = data else {
                print("No data!")
                return
            }
            
            let json = JSON(data: data)
            if let jsonArticles = json["articles"].array {
                
                for pars in jsonArticles {
                    
                    let author = pars["author"].stringValue
                    let title = pars["title"].stringValue
                    let urlToImage = pars["urlToImage"].stringValue
                    
                    let array = Network(author: author, title: title, urlToImage: urlToImage)
                    self.network.append(array)
                }
                
                print("article: \(self.network)")
            }
            
            DispatchQueue.main.async {
                complection(self.network, error)
            }
            
        }.resume()
    }
}





