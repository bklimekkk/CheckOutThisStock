import SwiftUI
//import Firebase
//
struct ContentView: View {
    @StateObject var watchlist = WatchlistManager()
    @StateObject var readLater = ReadLaterManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea()
                
                VStack {
                    Text("Stock News")
                        .font(.system(size: 50))
                        .padding(.top, 20)
                    Spacer()
                    
                    Image("money")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .aspectRatio(1, contentMode: .fit)
                    
                    Spacer()
                    
                    DescriptionButton(description: "Discover stocks")
                    DescriptionButton(description: "Customize Watchlist")
                    
                    Text("Browse news")
                        .font(.system(size: 30))
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: SearchStocksView())
                    {
                        accessButton(title: "Search for stocks")
                    }
                    
                    Text("Icons made by Freepik from www.flaticon.com")
                        .foregroundColor(Color(.gray))
                        .padding(.top, 20)
                }
                .navigationBarHidden(true)
            }
        }
        .environmentObject(watchlist)
        .environmentObject(readLater)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct accessButton: View {
    var title: String
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 15)
                .fill(Color("MainScreenButtons"))
                .frame(width: 330, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Button(action: {}) {}
            
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 30))
        }
        
    }
}

struct DescriptionButton: View {
    var description: String?
    var body: some View {
        Text(description ?? "")
            .font(.system(size: 30))
            .padding(.bottom, 5)
    }
}
