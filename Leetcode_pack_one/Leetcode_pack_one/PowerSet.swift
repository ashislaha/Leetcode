//
//  PowerSet.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 03/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class PowerSet {

	static func test() {
		let powerSet = PowerSet()
		//let result = powerSet.subsetsWithDup([1,2,2])
		let result = powerSet.subsetsWithDup([4,4,4,1,4])
		
		/*
		
		[[4,4,4,4],[4,4],[1,4],[],[4,4,4],[4,4,1],[1],[4,4,4,1,4],[4],[4,4,1,4]
		[4,4,4,1], [4,1,4], [4,1]
		]
		
		[[],[1],[1,4],[1,4,4],[1,4,4,4],[1,4,4,4,4],[4],[4,4],[4,4,4],[4,4,4,4]]
		
		common --> [4,4,4,1] and [4,4,1,4]
		
		so before adding to the result set, sort the result and add it so that it can remove the duplicate entry.
		
		*/
		
		
		print(result)
	}
	
	
	func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
		
		guard !nums.isEmpty else { return [[]] }
		
		let size = Int(pow(Double(2), Double(nums.count)))
		
		var results: Set<[Int]> = [[]] // to remove the duplicate element
		
		for i in 0...size-1 {
			
			var tempResult: [Int] = []
			
			for j in 0...nums.count-1 {
				
				let shouldInclude = (i & (1<<j)) != 0
				if shouldInclude {
					tempResult.append(nums[j])
				}
				
			}
			
			// before inserting into results, make sure all are distinct, no duplicate elements
			// tempResult --> [4,4,4,1], we have results --> [ [4,4,1,4], ...] so we should not allow to add it
			
			// we can sort the array and insert it, it will reduce duplicate
			results.insert(tempResult.sorted())
		}
		
		return Array<[Int]>(results)
	}
}
