//
//  funzioni.swift
//  Moodie
//
//  Created by Dominick Ferraro on 08/04/21.
//  Copyright © 2021 Duy Bui. All rights reserved.
//

import Foundation
import SwiftUI

func negativo( text:String) -> Int{
    return 0
}

func neutro( text:String) -> Int{
    return 1
}
func positivo( text:String) -> Int{
    return 2
}



 



func random_sentence() -> String {
    let array = ["Nice to meet ‘ya ! My day has been awful so far what about yours?🤔",
                 "That’s a cool name! Now that we are intimate, would you tell me how your day has gone?✌🏻",
                 "What a beautiful name! How was your day?👀",
                 "Nice to meet you! I’ll try to recommend you the perfect movie. Let’s chat a little bit! First off, how are you doing?👀",
                  "Fantastic, i like your name 😁. I’ll try to recommend you the perfect movie. How are you?",
                  "Great, my friend. I'm good at recommending films, try me😎. How was your day?",
                  "Fine, buddy! How are you doing?🤙🏻"
                        ]
    return array.randomElement()!
}
func random_sentenceUno() -> String {
    let array = ["Wow, as me!"]
    return array.randomElement()!
}






func shareButton() {
    
    
//    let items = ["This app is my favorite"]
//    let ac = UIActivityViewController(activityItems: items, applicationActivities: nil).present(ac, animated: true)
    
    
    
    
       /* var title = "pippo"
        let activityController = UIActivityViewController(activityItems: [title], applicationActivities: nil)

        UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)*/
   
    /*guard let data = URL(string: "https://www.zoho.com") else { return }
    let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
    
    UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)*/
    
 
}


func  share(){
    let url = URL (string: "https://whatsapp.com")
    let activityView = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
    UIApplication.shared.windows.first?.rootViewController?.present(activityView, animated: true, completion: nil)
    if UIDevice.current.userInterfaceIdiom == .pad {
        activityView.popoverPresentationController?.sourceView = UIApplication.shared.windows.first
        activityView.popoverPresentationController?.sourceRect = CGRect(
        x:UIScreen.main.bounds.width / 2.1,
        y:UIScreen.main.bounds.height / 2.3,
            width:200, height:200  )
    }
}

