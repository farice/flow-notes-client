//
//  Node.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import Foundation

public struct Node<T>: Equatable where T: Hashable {
    
    public var data: T
    public let index: Int
    
}

extension Node: CustomStringConvertible {
    
    public var description: String {
        return "\(index): \(data)"
    }
    
}

extension Node: Hashable {
    
    public var hashValue: Int {
        return "\(data)\(index)".hashValue
    }
    
}

public func ==<T>(lhs: Node<T>, rhs: Node<T>) -> Bool {
    return lhs.index == rhs.index && lhs.data == rhs.data
}
