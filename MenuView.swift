import SwiftUI

struct MenuView: View {
    
    @State var show = false
    @State var i : Int = 0
    var quiz = TotalQuiz()
    
    var articles = Article().articleCollections()
    
    var body: some View {
        
        if show {
            let getArticle = Article().getArticle(i: i)
            ArticleDetails(show: $show, id: getArticle.id, img: getArticle.image, title: getArticle.title, topics: getArticle.topic, description : getArticle.description)
        }
        
        if !show {
            ZStack {
                ScrollView(showsIndicators: false) {
                    
                    Text("Articles")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 10)
                        .padding(20)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack () {
                            ForEach(Array(articles.enumerated()), id: \.offset) { index, article in
                                GeometryReader { geometry in
                                    ArticleCollections(show: $show, id: index, img: article.image, title: article.title, description: article.description)
                                        .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 40) / -30), axis: (x: 0, y: 10.0, z: 0))
                                }
                                .frame(width: 330, height: 420)
                                .shadow(color: Color.gray.opacity(0.25), radius: 10, x: 0, y: 5)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                                        i = index
                                        show.toggle()
                                    }
                                }
                            }
                        }
                        .padding(25)
                        .animation(.easeInOut(duration: 0.5), value : show)
                    }.onAppear {
                        show = false
                    }
                    
                    Text("Quizzes")
                        .font(.title)
                        .font(.footnote.bold())
                        .fontWeight(.bold)
                        .foregroundColor(.brown)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                    
                    ZStack {
                        NavigationLink(destination: TotalQuizCollections(quiz: quiz)) {
                            VStack {
                                VStack {
                                    
                                    HStack {
                                        Image("quiz")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth : .infinity, alignment : .trailing)
                                    }
                                    
                                    Text("Quizzes")
                                        .font(.title)
                                        .fontWeight(.bold)

                                        .frame(maxWidth : .infinity, alignment : .leading)
                                    
                                    Text("Before you take the quizzes, You need to read the above articles carefully. Have fun !!!!")
                                        .font(.title2)
                                        .frame(maxWidth : .infinity, alignment : .leading)
                                }
                            }
                            .padding(25)
                            .frame(width: 350, height: 300)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.brown, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .cornerRadius(20)
                            )
                        }
                    }
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.leading, 25)
                    
                }
                .foregroundColor(.brown)
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
