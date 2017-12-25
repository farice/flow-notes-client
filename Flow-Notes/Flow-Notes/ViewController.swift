//
//  ViewController.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/25/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start up local Node server at port 4000 before running for ApolloClient to connect
        let apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
        
        let input = MessageInput(content: "hello, world!", author: "@farice")
        
        apollo.perform(mutation: PostMessageMutation(messageInput: input)) { (result, error) in
            if let id = result?.data?.createMessage?.id {
                print("Successfully posted message with id: " + id) // Message id
            } else {
                print("Mutation failed")
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

