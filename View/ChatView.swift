//
//  ContentView.swift
//  Moodie
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    @ObservedObject private var keyboard = KeyboardResponder()
    @State private var isPresented:Bool = false
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().tableFooterView = UIView()
    }
   
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                        MessageView(currentMessage: msg)
                    }
                }
                HStack {
                    TextField("Message...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    Button(action: sendMessage) {
                        Text("Send")
                    }
                    
                    
                }.frame(minHeight: CGFloat(50)).padding()
            }.navigationBarTitle(Text(DataSource.firstUser.name), displayMode: .inline)
            .padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        }.onTapGesture {
                self.endEditing(true)
        }
        .sheet(isPresented: $chatHelper.isPresented, content: {
            ContentLocandina(sentiment: chatHelper.label, film: $chatHelper.film)
        })
    }
    
    func sendMessage() {
        let type = DataSource.messageType.remove(at: 0)
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser, type: type))
//        chatHelper.sendMessage(Message(content: "Ciao Mario", user: DataSource.firstUser))
        
       // typingMessage = ""

        /*chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        chatHelper.sendMessage(Message(content: "Come mai?", user: DataSource.firstUser))
*/
        typingMessage = ""

        
    }
    
    func sendMessage1(){
        chatHelper.sendMessage(Message(content: typingMessage, user: DataSource.secondUser))
        typingMessage = ""
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .preferredColorScheme(.dark)

    }
}
