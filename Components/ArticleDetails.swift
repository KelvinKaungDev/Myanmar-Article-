import SwiftUI

struct ArticleDetails: View {
    
    @Binding var show : Bool
    @State private var selectedTab = 0
    @State private var showHistory = false
       
    var id : Int
    var img : String
    var title : String
    var topics : [[String]]
    var description : String
    
    var body: some View {
        ZStack {
            ScrollView (showsIndicators: false){
                cover
                detail
            }
            .ignoresSafeArea()

            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in : Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.trailing, 30)
        }.navigationBarBackButtonHidden()
    }
    
    var cover : some View {
        VStack{
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 250)
        .padding(20)
        .foregroundColor(.white)
        .background(
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .overlay (
            VStack (alignment: .leading, spacing: 12){
                Text(title)
                    .font(.largeTitle.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(description)
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .blur(radius: 0)

                )
                .offset(y: 180)
                .padding(20)
            )
    }
    
    var detail : some View {
        VStack {
    
            VStack {
                ForEach(topics, id : \.self) { topic in
                    Text(topic[0])
                        .font(.title2)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 20)
                        .foregroundColor(.brown)
                    
                    Image(topic[1])
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .padding(10)
                    
                    Text(topic[2])
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.brown)
                }
            }
            .padding(20)
            .transition(.asymmetric(insertion: .scale, removal: .opacity))
            
            
            VStack {
                NavigationLink(destination: SingleQuizCollections(quiz: SingleTopicQuiz(topicNumber: id))) {
                    Text("Take Quiz")
                        .fontWeight(.bold)
                        .frame(width: 280, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.brown)
                        .cornerRadius(10)
                        .padding(.top, 20)
                }
                .padding(.bottom, 20)
            }
        }
        .padding(.top, 140)
    }
}

struct ArticleDetails_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetails(show: .constant(true), id: 0, img: "", title: "", topics: [[""]], description: "")
    }
}

