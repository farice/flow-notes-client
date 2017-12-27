//
//  DataServer.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import Foundation
import Apollo
import RealmSwift

class DataServer {
    
    public static let sharedInstance = DataServer()
    
    var apollo: ApolloClient?
    var realm: Realm?
    
    init() {
        // Start up local Node server at port 4000 before running for ApolloClient to connect
        self.apollo = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
        
        // Local data persistence
        realm = try! Realm()
    }
    
    public func addNoteNode(prevNode node: Node<Note>?, graph: ALGraph<Note>) -> Note {
        
        return Note(id: "tmp")
    }

}
