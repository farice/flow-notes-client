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
    // Alternative is force-touching an existing node (perhaps)
    @IBOutlet weak var addNodeButton: UIBarButtonItem!
    // Tap this button once you've selected the preceding note
    @IBOutlet weak var okButton: UIBarButtonItem!

    var sharedInstance = DataServer.sharedInstance
    
    // DAG represented as adjacency list
    var noteGraph: ALGraph<Note>?
    var precedingNode: Node<Note>?
    // True when we're selecting the preceding node for our new node we're about to create
    var selectingPrecNode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // TODO: - We'll want to pass this in to the view so we can initialize a non-empty DAG
        // In the future, this view would be accessed by either selecting a previously modified DAG or choosing to start anew
        // Hence, we should precede this VC with a TableView to make this choice
        // Side note: I'd like to use Realm for local persistence
        self.noteGraph = ALGraph<Note>()
        
        self.addNodeButton.isEnabled = true
        self.okButton.isEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshNavButtons() {
        self.addNodeButton.isEnabled = !selectingPrecNode
        self.okButton.isEnabled = selectingPrecNode
    }
    
    // MARK: - Actions
    
    @IBAction func tappedAddNode(_ sender: UIBarButtonItem) {
        // User wants to add node, first must specify preceding node
        self.title = "Select a preceding node?"
        self.selectingPrecNode = true
        self.refreshNavButtons()
    }
    
    @IBAction func tappedOkaySegue(_ sender: UIBarButtonItem) {
        self.title = ""
        self.selectingPrecNode = false
        self.refreshNavButtons()
        
        self.performSegue(withIdentifier: "editNoteSegue", sender: self)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let sender = sender as? ViewController {
            if segue.identifier == "editNoteSegue" {
                if let destination = segue.destination as? EditNoteViewController {
                    // Would prefer doing this asynchronously
                    let newNode = sharedInstance.addNoteNode(prevNode: precedingNode, graph: self.noteGraph!)
                    destination.node = newNode
                }
            }
        }
    }

}

