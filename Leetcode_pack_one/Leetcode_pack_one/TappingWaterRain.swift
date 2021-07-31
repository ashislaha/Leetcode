//
//  TappingWaterRain.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 31/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class TappingWaterRain {
	
	func trap(_ height: [Int]) -> Int {
		
		
		// if it contains a single item, then we cannot store water, return 0
		guard height.count > 1 else { return 0 }
		
		// calculate left
		var left = height
		for i in 1...height.count-1 {
			if left[i] < left[i-1] {
				left[i] = left[i-1]
			}
		}
		
		// calculate right max
		var right = height
		for i in stride(from:height.count-2, through:0, by: -1) {
			if right[i] < right[i+1] {
				right[i] = right[i+1]
			}
		}
		
		// compare
		var sum = 0
		for i in 0...height.count-1 {
		   sum += (min(left[i], right[i]) - height[i])
		}
		
		return sum
	}
	
}
