//
//  ContentMessageView.swift
//  Moodie
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import SwiftUI

struct ContentMessageView: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.black : Color.black)
            .background(isCurrentUser ? Color(UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)) : Color(UIColor(red: 242/255, green: 191/255, blue: 75/255, alpha: 1.0)))
            .cornerRadius(15)
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "Hi, I am your friend", isCurrentUser: false)
            .preferredColorScheme(.dark)
    }
}
