//
//  Message.swift
//  Moodie
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import Foundation
enum MessageType {
    case none
    case name
    case day
    case consigliaFilm
    case more
}


struct Message: Hashable {
    var content: String
    var user: User
    var type:MessageType = .none
    
}

struct DataSource {
    static let firstUser = User(name: "MoodBot", avatar: "eye")
    static var secondUser = User(name: "User", avatar: "v", isCurrentUser: true)
    static var messageType:[MessageType] = [.name,.more,.day,.consigliaFilm]
    static let messages = [
        Message(content: "I'm MoodBot🤖. What's your name?", user: DataSource.firstUser),
//        Message(content: "test", user: DataSource.firstUser),

        
//        Message(content: "😇", user: DataSource.firstUser),
]
        /*Message(content: "Thanks, nice to hear that, can I have your email please?", user: DataSource.secondUser),
        Message(content: "😇", user: DataSource.firstUser),
        Message(content: "Oh actually, I have just purchased the chat template, so please check your email, you might see my order", user: DataSource.firstUser),
        Message(content: "Great, wait me a sec, let me check", user: DataSource.secondUser),
        Message(content: "Sure", user: DataSource.firstUser)*/

    
    
}
