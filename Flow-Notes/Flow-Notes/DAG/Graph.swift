//
//  Graph.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

// Helpful reference implementation: https://github.com/raywenderlich/swift-algorithm-club/tree/master/Graph/Graph

import Foundation

private class EdgeList<T> where T: Hashable {
    
    var node: Node<T>
    var edges: [Edge<T>]?
    
    init(node: Node<T>) {
        self.node = node
    }
    
    func addEdge(_ edge: Edge<T>) {
        edges?.append(edge)
    }
    
}

// Graph represented as an adjacency list
public class ALGraph<T>: CustomStringConvertible where T: Hashable {
    
    fileprivate var adjacencyList: [EdgeList<T>] = []
    
    public required init() {}
    
    public required init(fromGraph graph: ALGraph<T>) {
        for edge in graph.edges {
            let from = createNode(edge.from.data)
            let to = createNode(edge.to.data)
            
            addDirectedEdge(from, to: to)
        }
    }
    
    public var nodes: [Node<T>] {
        var nodes = [Node<T>]()
        for edgeList in adjacencyList {
            nodes.append(edgeList.node)
        }
        return nodes
    }
    
    public var edges: [Edge<T>] {
        var allEdges = Set<Edge<T>>()
        for edgeList in adjacencyList {
            guard let edges = edgeList.edges else {
                continue
            }
            
            for edge in edges {
                allEdges.insert(edge)
            }
        }
        return Array(allEdges)
    }
    
    public func createNode(_ data: T) -> Node<T> {
        // Create a new one
        let node = Node(data: data, index: adjacencyList.count)
        adjacencyList.append(EdgeList(node: node))
        return node
    }
    
    public func addDirectedEdge(_ from: Node<T>, to: Node<T>) {
        // works
        let edge = Edge(from: from, to: to)
        let edgeList = adjacencyList[from.index]
        if edgeList.edges != nil {
            edgeList.addEdge(edge)
        } else {
            edgeList.edges = [edge]
        }
    }
    
    public func edgesFrom(_ sourceNode: Node<T>) -> [Edge<T>] {
        return adjacencyList[sourceNode.index].edges ?? []
    }
    
    public var description: String {
        var rows = [String]()
        for edgeList in adjacencyList {
            
            guard let edges = edgeList.edges else {
                continue
            }
            
            var row = [String]()
            for edge in edges {
                let value = "\(edge.to.data)"
                row.append(value)
            }
            
            rows.append("\(edgeList.node.data) -> [\(row.joined(separator: ", "))]")
        }
        
        return rows.joined(separator: "\n")
    }
}
