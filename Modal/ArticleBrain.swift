import SwiftUI
import CoreGraphics

struct ArticleBrain : Identifiable, Hashable{
    
    var id: Int
    var image : String
    var title : String
    var topic : [[String]]
    var description : String
    
    init(id: Int, title: String, description: String, image: String, topic : [[String]]) {
        self.id = id
        self.title = title
        self.image = image
        self.topic = topic
        self.description = description
    }
}


