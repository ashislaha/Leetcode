//
//  partition_array_disjoint_intervals.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 22/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class PartitionArrayIntoDisjointIntervals {
	
	static func test() {
		let t = PartitionArrayIntoDisjointIntervals()
		let r = t.partitionDisjoint([1,1,1,0,6,12]) // 
		print(r)
	}
	
	func partitionDisjoint(_ nums: [Int]) -> Int {
		
		guard !nums.isEmpty else { return 0 }
			 
			  var l = nums
			  var r = nums
			  
			  // left array contains all the maximum elements
			  for i in 1...nums.count-1 {
				if l[i] < l[i-1] {
					l[i] = l[i-1]
				}
			  }
			  
			  // right array contains all the minimum elements
			for i in stride(from: nums.count-2, to: -1, by: -1) {
				
				if r[i] > r[i+1] {
					r[i] = r[i+1]
 				}
				
			  }
			  
			  // iterate both l and r
		
		for i in 1...nums.count-1 {
			if l[i-1] <= r[i] {
				return i
			}
		}
		
		return 0
	}
	
}
