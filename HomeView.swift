import SwiftUI

struct HomeView: View {

    var body: some View {
        NavigationView {
            VStack {
                VStack (spacing : 10) {
                    Text("Welcome to Myanmar")
                        .font(.system(size: 32))
                        .fontWeight(.bold)
                    
                    Text("Discover the rich culture and natural beauty")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineSpacing(0)
                }
                .foregroundColor(Color.white)
                .padding(.top,130)
                .padding(.bottom, 50)
                .lineSpacing(19)
                
                Spacer()
                                
                NavigationLink(destination: MenuView()) {
                    Text("Get Start")
                        .fontWeight(.bold)
                        .frame(width: 280, height: 50, alignment: .center)
                        .foregroundColor(.white)
                        .background(.brown)
                        .cornerRadius(10)
                        .padding(.top, 50)
                }
                .padding(.bottom, 150)
            }
            .background(
                Image("home")
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
