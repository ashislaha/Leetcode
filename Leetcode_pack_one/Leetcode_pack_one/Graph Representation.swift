//
//  Graph Representation.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 08/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class GraphNode {
	let val: String
	var next: GraphNode?
	
	init(val: String) {
		self.val = val
		self.next = nil
	}
}

class GraphEdge {
	let weight: Int
	let source: GraphNode
	let destination: GraphNode
	
	init(weight: Int = 1, source: String, destination: String) {
		self.weight = weight
		self.source = GraphNode(val: source)
		self.destination = GraphNode(val: destination)
	}
	
	init(weight: Int = 1, source: GraphNode, destination: GraphNode) {
		self.weight = weight
		self.source = source
		self.destination = destination
	}
}

class Graph {
	
	var vertices: [GraphNode] = [] // space complexity = O(|V|) assume string values are constant even if they are different
	var edges: [GraphEdge] = [] // space complexity = O()
	
	/// If we are using adjacentList, we do not need to represent any edge or vertices
	var adjacentList: [String: GraphNode] = [:] // Representing a Graph
	
	init(v: [String], e: [(String, String)]) {
		for each in v {
			let vertex = GraphNode(val: each)
			vertices.append(vertex)
			adjacentList[each] = vertex
		}
		
		for each in e {
			edges.append(GraphEdge(source: each.0, destination: each.1))
		}

		compueteAdjancancyList(e: e)
	}
	
	func compueteAdjancancyList(e: [(String, String)]) {
		
		for each in e {
			
			guard let sourceNode = adjacentList[each.0] else { return }
			
			let newNode = GraphNode(val: each.1)
			
			if let adjNode = sourceNode.next {
				// add destination
				newNode.next = adjNode
				sourceNode.next = newNode
			} else {
				// we are adding first time
				sourceNode.next = newNode
			}
		}
	}
	
	func printAdjList() {
		for (key, value) in adjacentList {
			print("Adjacency list of Node \(key) -->", terminator: "")
			var temp: GraphNode? = value
			while temp != nil {
				print(temp!.val , terminator: "")
				temp = temp!.next
			}
			print("\n\n")
		}
	}
	
	
	static func testcases() {
		
		let graph = Graph(v: ["a", "b", "c", "d"], e: [("a", "b"), ("b","c"), ("c", "d"), ("a","d")])
		graph.printAdjList()
	}
}
