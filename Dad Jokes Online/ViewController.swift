//
//  ViewController.swift
//  Dad Jokes Online
//
//  Created by Phyllis Wong on 2/8/18.
//  Copyright © 2018 Phyllis Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    var jokes = [Joke]()
    
    
    // Outlets
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    
    
    // Actions
    @IBAction func didPressJoke() {
        self.jokes = [Joke]()
        let dispatchGroup = DispatchGroup()
        self.fetch(dispatchGroup: dispatchGroup)
        print("press joke button")
        dispatchGroup.notify(queue: .main, execute: {
            self.undateLabels()
            self.view.reloadInputViews()
        })
    }
    
    
    
    @IBAction func didPressPunchline() {
        print("did press the button")
        punchlineLabel.text = jokes[0].punchline
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Dad Jokes Online"
        
        // This allows the dispatch queue to controll the threads
        let dispatchGroup = DispatchGroup()
        self.fetch(dispatchGroup: dispatchGroup)
        
        dispatchGroup.notify(queue: .main, execute: {
            self.undateLabels()
            self.view.reloadInputViews()
        })
   
    }
    
    func undateLabels() {
        self.setupLabel.text = jokes[0].setup
        self.punchlineLabel.text = "..."
    }
    
    func fetch(dispatchGroup: DispatchGroup) {
        
        dispatchGroup.enter()
        
        let jsonURLString = "https://08ad1pao69.execute-api.us-east-1.amazonaws.com/dev/random_joke"
        guard let url = URL(string: jsonURLString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let joke = try JSONDecoder().decode(Joke.self, from: data)
                
                self.jokes.append(joke)
                dispatchGroup.leave()
                
                print("Type: \(joke.type)\nsetup: \(joke.setup)\npunchline: \(joke.punchline)")
            }
                
            catch let jsonErr {
                print("error serializing json:", jsonErr)
            }
            }.resume()
        
    }

}

