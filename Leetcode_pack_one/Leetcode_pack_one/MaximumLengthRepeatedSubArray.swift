//
//  MaximumLengthRepeatedSubArray.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 10/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class MaximumLengthRepeatedSubArray {
	
	static func test() {
		let maxLenRepeatedSubArr = MaximumLengthRepeatedSubArray()
		let result = maxLenRepeatedSubArr.findLength([0,0,0,0,1], [1,0,0,0,0])
		print(result)
	}
	
	func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
		
		if nums1.isEmpty || nums2.isEmpty { return 0 }
		
		// build a look up table
		var lookup: [[Int]] = []
		for _ in 0...nums1.count-1 {
			
			let temp: [Int] = Array<Int>(repeating: 0, count: nums2.count)
			lookup.append(temp)
		}
		
		// go through the matrix
		var maxCount = 0
		for i in 0...nums1.count-1 {
			for j in 0...nums2.count-1{
				
				
				if i == 0 || j == 0 {
					if nums1[i] == nums2[j] {
						lookup[i][j] = 1
					}
				} else {
					
					if nums1[i] == nums2[j] {
						lookup[i][j] = lookup[i-1][j-1] + 1
					}
				}
				
				if lookup[i][j] > maxCount {
					maxCount = lookup[i][j]
				}
				
			}
		}
		
		return maxCount
	}

}
