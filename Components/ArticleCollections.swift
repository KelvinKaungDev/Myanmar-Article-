import SwiftUI

struct ArticleCollections: View {
    
    @Binding var show : Bool
    
    var id : Int
    var img : String
    var title : String
    var description : String
    
    var body: some View {
        
        VStack {
            Image(img)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(contentMode: .fill)
            
            Text(title.uppercased())
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Text(description)
                .font(.title3)
                .padding()
                .lineLimit(4)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
