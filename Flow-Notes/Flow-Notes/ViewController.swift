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
        
        // Start up local node server at port 4000 before running for ApolloClient to connect
        let apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
        
        apollo.fetch(query: HelloWorldQuery) { (result, error) in
            guard let data = result?.data else { return }
            print(data?.hello) // "Hello world!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

