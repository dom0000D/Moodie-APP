//
//  ChatHelper.swift
//  Moodie
//
//  Created by Duy Bui on 2/2/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import Combine
import CoreML
import NaturalLanguage



class ChatHelper : ObservableObject {
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages = DataSource.messages
    @Published var label:String = ""
    @Published var film = Film(titolo: "", descrizione: "", locandina: "")
    @Published var isPresented = false
    let model: NLModel = {
        
        do {
            //use a model configuration instance to configure an MLModel instance
            let config = MLModelConfiguration() //general configuration class
            
            //Instance of the model created with CreateML file
            let model = try MoodClassificUno(configuration: config).model
            
            //final sentiment classifier instance to use
            let sentimentClassifier = try NLModel(mlModel: model)
            
            return sentimentClassifier
        }
        catch
        {
            print(error)
            
            fatalError("Couldn't create Sentiment Classifier!!!")
        }
    }()
    
    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
        if chatMessage.user == DataSource.secondUser {
            switch chatMessage.type {
            case .name:
                self.sendMessage(Message(content: "Hi \(chatMessage.content) 🖖🏻", user: DataSource.firstUser))
                self.sendMessage(Message(content: random_sentence(), user: DataSource.firstUser))
//                self.sendMessage(Message(content: "What's up?", user: DataSource.firstUser))
        
          
            case .more:
                
                classify(sentence: chatMessage.content)
                var risposta:String = ""
                
                switch label {
                
                case "neg":
               risposta =  "Tell me more, come on! I'm all ears. 😄"

                    
                case "positivi":
                    risposta = "I want to know! Tell me more, I'm here! 😄"

                    
                case "neutro principali":
                risposta =    "What happened?🤔"
                    
                default:
                    break
                }
                self.sendMessage(Message(content: risposta, user: DataSource.firstUser))
               
               
            case .day:
                
                classify(sentence: chatMessage.content)
                var risposta:String = ""
                
                switch label {
                
                case "neg":
               risposta =  "I gotch'ya!😌  Maybe I know the film for you, ready? 💪🏻💪🏻"

                    
                case "positivi":
                    risposta = "That's awesome! It seems to be the time to watch a great movie, doesn't it? 🎬 🎬"
//                    risposta = "Mi fa piacere, sono contento per te!. Sono qui per consigliarti un bel film, starai ancora meglio!"
                    
                case "neutro principali":
                risposta =    "Interesting... Do you want to watch a film?😉"
                    
                default:
                    break
                }
                self.sendMessage(Message(content: risposta, user: DataSource.firstUser))
                
           
        
            
                
            
                
            case .consigliaFilm:
                
                self.sendMessage(Message(content: "Here is the movie for you, Enjoy the movie 🍿🎬", user: DataSource.firstUser))
               
                switch label {
                
                case "neg":
                    
                    film = arrayNegativi.randomElement()!
                    
                case "positivi":
                   
                    film = arrayPositivi.randomElement()!
                
                case "neutro principali":
                   
                    film = arrayNeutri.randomElement()!
               
                default:
                    break
                }
                
                isPresented = true
                
                
//                self.sendMessage(Message(content: risposta, user: DataSource.firstUser))
                
                
                
            default:
                break
            }
            
        }
        
    }
    
    
    
    func classify(sentence:String)
    {
        if let l = model.predictedLabel(for: sentence)
        {
            label = l
        }
    }
}

/*case .quattro:
    self.sendMessage(Message(content: "Tell me more, come on!", user: DataSource.firstUser))

   */
    
