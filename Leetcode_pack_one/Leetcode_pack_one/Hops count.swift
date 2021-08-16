//
//  Hops count.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 16/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

/*
Given a road segment network, find the longest connected segment chain. Every segment has unit length.
The longest is defined by the number of hops in a chain. -1 represents the end of the chain.
All IDs are assumed correct, i.e. if ID is not -1 it's assumed to be in the input. There can be only 1 outgoing segment from each node.
 
For example, 5->6->100->4->-1. = 4 hops
100 -> 4 -> -1 = 2 hops


segment <- 5 -> 6
ID <-- 5,6,

summarize --> I have N numbers hops, M nunber segment

segment 1 --> 5->6->100->4->-1 (4hops) O(|Size|)
segment 2 --> 1->2->3->10->4->-1 (5 hops) O(|Size|)
segment 3 --> 20->30->11->-1 (3 hops)
segment 4 --> 3->6->100->4->-1 (4hops)

lookup: [Int: Int] = [:] // ID: hops

4: -1
11: -1
100: 4
6: 100
5: 6
10:4
3:10
20: 30
30: 11


loopkup[11] = 1

// top to down approach
lookup[k]

*/

// 5(5)  -> 6 -> 7 (3 )
func getLookup(_ input: [Int: Int]) -> [Int: Int] {
	
	var lookup: [Int: Int] = [:]
	for (key, _) in input {
		lookup[key] = computeHops(key, input: input, lookup: &lookup)
	}
	return lookup
}

// 5(5)  -> 6 -> 7 (3 ) .... 11->-1
func computeHops(_ key: Int, input: [Int: Int], lookup: inout [Int: Int]) -> Int {
	if key == -1 {
		lookup[key] = 0
		return 0
	} else if let value = lookup[key] {
		return value
	} else {
		// fill lookup
		let parent = input[key]!
		let parentValue = computeHops(parent, input: input, lookup: &lookup)
		lookup[key] = parentValue + 1
		return lookup[key]!
	}
}



func getMax(_ input: [Int: Int], segementstartingPoint: [Int]) -> Int {
	
	guard !input.isEmpty else { return 0 }
	
	// preprocessing input to compute the lookup table
	let lookup: [Int: Int] = getLookup(input)
	
	var maxCount = Int.min
	for each in segementstartingPoint {
		if let value = lookup[each], value > maxCount {
			maxCount = value
		}
	}
	
	return maxCount
}


// Representation of inputs:

class SegmentNode {
	let id: Int
	var next: SegmentNode?
	let inDegree: Int
	// outdegree is always 1 except the last node when id == -1
	
	init(val: Int, inDegree: Int) {
		self.id = val
		self.inDegree = inDegree
	}
}


