//
//  4Sum.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 17/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class FourSums {
	
	static func test() {
		let fourSum = FourSums()
		
		let input1 = [0,0,0,0]
		let target1 = 0
		let results1 = fourSum.getResult(input1, target1) // [0,0,0,0]
		print(results1)

		let input2 = [1, 0, -1, 0, -2, 2]
		let target2 = 0
		let results2 = fourSum.getResult(input2, target2) // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
		print(results2)

		let input3 = [2,1,0,-1]
		let target3 = 2
		let results3 = fourSum.getResult(input3, target3) //  [[2,1,0,-1]]
		print(results3)


		let input4 = [-2,-1,-1,1,1,2,2]
		let target4 = 0
		let results4 = fourSum.getResult(input4, target4) //
		print(results4)
	}
	
	func getResult(_ nums: [Int], _ target: Int) -> [[Int]] {
		guard nums.count >= 4 else { return [] }
		
		
		
		// idea is
		// --> 1. sort the array (in below solution I did not sort it as I am using a map/set )
		// --> 2. to keep the first 3 loops constants.
		// we are saving the element in map and checking the diff present in the map.
		// we can avoid the map by moving two pointer from begin position and end position
		
		var results: [[Int]] = []
		for i in 0...nums.count-4 {
			for j in i+1...nums.count-3 {
				
				var lookup: Set<Int> = []
				for k in j+1...nums.count-1 {
					
					let total = nums[i] + nums[j] + nums[k]
					let diff = target - total
					
					if lookup.contains(diff) {
						// got a match
						results.append([diff, nums[k], nums[j], nums[i]])
					} else {
						// add it into lookup
						lookup.insert(nums[k])
					}
				}
			}
		}
		
		var finalResults: [[Int]] = []
		if results.count == 1 {
			finalResults = results
		}
		
		// filter out the results
		if results.count > 1 {
				for i in 0...results.count-2 {
					
					let set1 = Set(results[i])
					var isDuplicate = false
					
					for j in i+1...results.count-1 {
						let set2 = Set(results[j])
						
						if set1 == set2 {
							// duplicate present
							isDuplicate = true
							break
						}
					}
					
					if !isDuplicate {
						finalResults.append(results[i])
					}
					
				} // end of for i loop
				
			finalResults.append(results[results.count-1])
			
		}
		
		return finalResults
	}
	
}
