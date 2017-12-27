//
//  Graph.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

// Helpful reference implementation: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Graph/Graph

import Foundation

private class AdjList<T> where T: Hashable {
    
    var node: Node<T>
    var adjNodes: [Node<T>]?
    
    init(node: Node<T>) {
        self.node = node
        adjNodes = [Node<T>]()
    }
    
    func addAdj(_ node: Node<T>) {
        adjNodes?.append(node)
    }
    
}

// Graph represented as an adjacency list
public class ALGraph<T>: CustomStringConvertible where T: Hashable {
    
    fileprivate var adjacencyList: [AdjList<T>] = []
    
    public required init() {}
    
    public required init(fromGraph graph: ALGraph<T>) {
        for adjList in graph.adjacencyList {
            let from = createNode(adjList.node.data)
            if let adjNodes = adjList.adjNodes {
            for adjNode in adjNodes {
                let to = createNode(adjNode.data)
                addDirectedEdge(from, to: to)
            }
            }
        }
    }
    
    public var nodes: [Node<T>] {
        var nodes = [Node<T>]()
        for edgeList in adjacencyList {
            nodes.append(edgeList.node)
        }
        return nodes
    }
    
    public func createNode(_ data: T) -> Node<T> {
        // Create a new one
        let node = Node(data: data, index: adjacencyList.count)
        adjacencyList.append(AdjList(node: node))
        return node
    }
    
    public func addDirectedEdge(_ fromNode: Node<T>, to toNode: Node<T>) {
        // works
        let adjList = adjacencyList[fromNode.index]
        adjList.addAdj(toNode)
    }
    
    public func nodesFrom(_ sourceNode: Node<T>) -> [Node<T>] {
        return adjacencyList[sourceNode.index].adjNodes ?? []
    }
    
    public var description: String {
        var rows = [String]()
        for adjList in adjacencyList {
            
            guard let nodes = adjList.adjNodes else {
                continue
            }
            
            var row = [String]()
            for node in nodes {
                let value = "\(node.data)"
                row.append(value)
            }
            
            rows.append("\(adjList.node.data) -> [\(row.joined(separator: ", "))]")
        }
        
        return rows.joined(separator: "\n")
    }
}
