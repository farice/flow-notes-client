//
//  ViewController.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/25/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import UIKit
import Apollo

// This is the visualization view controller where a user can view his notes as a graph or as bullet points
class ViewController: UIViewController {

    // New node/bullet point button
    // Alternative is force-touching an existing node
    @IBOutlet weak var addNodeButton: UIBarButtonItem!
    
    var apollo: ApolloClient?
    var noteGraph: ALGraph<Note>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Start up local Node server at port 4000 before running for ApolloClient to connect
        self.apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
        
        /*
        let input = MessageInput(content: "hello, world!", author: "@farice")
        
        apollo.perform(mutation: PostMessageMutation(messageInput: input)) { (result, error) in
            if let id = result?.data?.createMessage?.id {
                print("Successfully posted message with id: " + id) // Message id
            } else {
                print("Mutation failed")
            }
            
        } */
        
        // TODO: - We'll want to pass this in to the view so we can initialize a non-empty DAG
        // In the future, this view would be accessed by either selecting a previously modified DAG or choosing to start anew
        // Hence, we should precede this VC with a TableView to make this choice
        
        self.noteGraph = ALGraph<Note>()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Called to create new note node with previous node specified
    func segueWithNode() {
        
    }
    
    // MARK: - Actions
    
    @IBAction func tappedAddNode(_ sender: UIBarButtonItem) {
        // User wants to add node, first must specify preceding node
    }
    
    
    

}

