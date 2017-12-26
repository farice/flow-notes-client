//
//  Edge.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import Foundation


public struct Edge<T>: Equatable where T: Hashable {
    
    public let from: Node<T>
    public let to: Node<T>
    
    //public let weight: Double?
    
}

extension Edge: CustomStringConvertible {
    
    public var description: String {
            return "\(from.description) -> \(to.description)"
//        return "\(from.description) -(\(unwrappedWeight))-> \(to.description)"
    }
    
}

extension Edge: Hashable {
    
    public var hashValue: Int {
        let string = "\(from.description)\(to.description)"
        return string.hashValue
    }
}


public func == <T>(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
    // add weight, if for some reason we come up with a reason for our representation to be weighted
    return lhs.from == rhs.from && lhs.to == rhs.to
}
