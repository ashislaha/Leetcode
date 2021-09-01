//
//  Array Nesting.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 01/09/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class ArrayNesting {
	
	static func test() {
		
		let t = ArrayNesting()
		let r = t.arrayNesting([0,1,2]) // 2
		print(r)
	}
	
	func arrayNesting(_ nums: [Int]) -> Int {
		
		var set: Set<Int> = []
		let N = nums.count
		
		var lookup: [Bool] = Array<Bool>(repeating: false, count: N)
		var result = 0
		
		for i in 0...N-1 where !lookup[i] {
			
			var element = nums[i]
			set = []
			
			while !set.contains(element) {
				set.insert(element)
				lookup[element] = true
				element = nums[element]
			}
			
			result = max(result, set.count)
		}
		
		return result
		
	}
}
