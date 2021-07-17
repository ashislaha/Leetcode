//
//  DisjointSet.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 17/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

/// Disjoint set Node

class DSNode: Equatable {
	
	static func == (lhs: DSNode, rhs: DSNode) -> Bool {
		return lhs.rank == lhs.rank && lhs.value == rhs.value && lhs.parent == rhs.parent
	}
	
	
	let value: Int
	var rank: Int
	var parent: DSNode? // representative node points to nil
	
	init(value: Int) {
		self.value = value
		self.rank = 0
		self.parent = nil
	}
}

/// Disjoint set 

class DisjointSet {
	
	
	static func test() {
		
		let disjointSet = DisjointSet()
		
		[1,2,3,4].forEach {
			disjointSet.makeSet($0)
		}
		[(1,2), (2,3), (3,4), (4,1)].forEach {
			disjointSet.union($0.0, $0.1)
		}
		
		[1,2,3,4].forEach {
			if let representative = disjointSet.findSet($0) {
				print(representative.value)
			}
		}
		
	}
	
	private var dict: [Int: DSNode] = [:]
	
	
	func makeSet(_ value: Int) {
		let node = DSNode(value: value)
		dict[value] = node
	}
	
	func findSet(_ value: Int) -> DSNode? {
		
		// returns the representative of the set
		guard let node = dict[value] else { return nil }
		
		let parent = node.parent
		if parent == nil {
			// we reach to the representative of the set
			return node
		}
		
		let rootParent = findSet(parent!.value)
		node.parent = rootParent
		return rootParent
	}
	
	
	
	func union(_ value1: Int, _ value2: Int) {
		
		guard let representative1 = findSet(value1),
			  let representative2 = findSet(value2)  else { return }
		
		
		if representative1 == representative2 {
			return // both belongs to same set
		}
		
		// union both set into a single set
		if representative1.rank > representative2.rank {
			representative2.parent = representative1
			
		} else if representative1.rank < representative2.rank {
			representative1.parent = representative2
		} else {
			// both have same rank
			representative2.parent = representative1
			representative1.rank += 1
		}
		
	}
}

