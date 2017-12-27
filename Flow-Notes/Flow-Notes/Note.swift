//
//  Note.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import Foundation

// Each "Note" looks like this and is represented as a "Node" (sorry for the annoying nomenclature)

class Note {
    
    public required init(id: String) {
        self.id = id
        self.text = ""
    }
    
    public required init(id: String, text: String) {
        self.id = id
        self.text = text
    }
    
    private var text: String
    public var id: String
    
    public func getText() -> String {
        return text;
    }
    
    public func setText(text: String) {
        self.text = text
    }
    
    
}

extension Note: Hashable {
    public var hashValue: Int {
        return "\(self.id)\(self.text)".hashValue
    }
    
    static func ==(lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }
}
