//
//  EasyOne.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 01/05/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import Foundation

class EasyOne {
	
	/*
	
		lets solve the problem where we have to find out a pair among in an array which matches to a target value. It may contains multiple pairs.
	
	Example: [4,2,3,7,2,8,5,1]
	target value = 5
	(2,3) (4,1) are the answer
	
	*/
	
	
	func findPair(array: [Int], target: Int) -> [(Int, Int)] {
		
		var result: [(Int, Int)] = []
		
		// maintain a set
		var set = Set<Int>()
		
		for each in array {
			let diff = target - each
			if set.contains(diff) {
				result.append((each, diff))
			}
			set.insert(each)
		}
		return result
	}
	
}
