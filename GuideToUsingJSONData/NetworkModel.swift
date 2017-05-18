
struct NetworkModel {

    let author: String
    let title: String
    let urlToImage: String
    
    enum SerializationError: Error {
        
        case missing(String)
        case invalid(String, Any)
    }
    
    init( json:[String:Any]) throws {
        guard let author = json["author"] as? String else {throw SerializationError.missing("summary is missing")}
        guard let title = json["author"] as? String else {throw SerializationError.missing("title is missing")}
        guard let urlToImage = json["author"] as? String else {throw SerializationError.missing("utlToImage is missing")}
        
        self.author = author
        self.title = title
        self.urlToImage = urlToImage
    }
}
