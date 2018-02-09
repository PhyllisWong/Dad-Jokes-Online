//
//  NetworkingService.swift
//  Dad Jokes Online
//
//  Created by Phyllis Wong on 2/8/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import Foundation

struct Joke : Decodable {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
}

//class Networking {
//    
//    let jsonURLString = "https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_joke"
//    guard let url = URL(string: jsonURLString) else { return }
//    
//    URLSession.shared.dataTask(with: url) { (data, response, err) in
//    guard let data = data else { return }
//    
//    do {
//    let joke = try JSONDecoder().decode(Joke.self, from: data)
//    print("Type: \(joke.type)\nsetup: \(joke.setup)\npunchline: \(joke.punchline)")
//    }
//    
//    catch let jsonErr {
//    print("error serializing json:", jsonErr)
//    }
//    }.resume()
//}







