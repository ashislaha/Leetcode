//
//  ThreeSumClosest.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 28/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class ThreesumClosest {
	
	func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
		
		guard nums.count >= 3 else { return 0 }
		
		let arr = nums.sorted()
		var lowestSum = Int.max
		var lastMin = Int.max
		
		for i in 0...arr.count-3 {
			
			var low = i + 1
			var high = arr.count-1
			
			while low < high {
				let sum = arr[i] + arr[low] + arr[high]
				let diff = target - sum
				
				if diff > 0 {
					low += 1
				} else {
					high -= 1
				}
				
				if abs(diff) < lastMin {
					lastMin = abs(diff)
					lowestSum = sum
				}
				
			} // end of while
			
		} // end of for
		
		return lowestSum
		
	}
	
}
