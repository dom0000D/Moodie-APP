import SwiftUI

struct ContentLocandina: View {
    @State var showDetails = false
    
    @State private var mainImagename=""
    @State private var mainImageLabel=""
    var sentiment = "pos"
    @Binding  var film:Film
    @Environment(\.presentationMode) var presentationMode
    @State var isShared = false
    
    func shareButton() {
        self.isShared = true
        presentationMode.wrappedValue.dismiss()
        
        
        
    }
    
    
    
    var body: some View {
        
        
        
        ZStack{
            
            
            
            Image("s")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            
            
            Spacer()
            ScrollView{
                VStack{
                    
                    Spacer()
                    Image(film.locandina)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(12)
                        .edgesIgnoringSafeArea(.all)
                        .padding(35)
                    
                    
                    
                    Text(film.titolo)
                        
                        .foregroundColor(.black)
                        
                        .font(.system(size: 26))
                        .bold()
                        .padding(5)
                        
                        .font(.title)
                    
                    
                    
                    Text(film.descrizione)
                        .foregroundColor(.black)
                        .font(.system(size: 25, design: .default))
                        
                        .padding()
                        
                        .font(.title)
                    Spacer()
                    
                    
                    Button(action: shareButton) {
                        Text("Share your Moodie")
                            .font(.largeTitle)
                        Image(systemName: "square.and.arrow.up")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                        
                    }
//                    VStack{
//                    Button(action: {
//                        self.showDetails.toggle()
//                    })
//                    {
//                        Text("Vedi un altro film")
//                    }
//                    if showDetails {
//                        Image(film.locandina)
//                    }
//                    Spacer()
//                    Spacer()
// 
//                    }
                }
               
                
            }
        }
        .onDisappear(perform: {
            if isShared {
                let myImage = UIImage(named: film.locandina)
                let activityController = UIActivityViewController(activityItems: [myImage! ,film.locandina,film.titolo, film.descrizione], applicationActivities: nil)
                
                UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
            }
        })
        
    }
    
}


/*----------------------------------   --------------------------------------------------- */
struct ContentLocandina_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentLocandina(film: .constant(arrayPositivi[0]))
        
        
    }
}
