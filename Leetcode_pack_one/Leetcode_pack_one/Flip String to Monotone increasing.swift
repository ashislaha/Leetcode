//
//  Flip String to Monotone increasing.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 10/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class FlipString {
	
	static func test() {
		let t = FlipString()
		let r = t.minFlipsMonoIncr("00110")
		print(r)
	}
	
	func minFlipsMonoIncr(_ s: String) -> Int {
		
		// feasible solution to get all the 1s
		var zeros = 0
		
		for each in s {
			if each == "0" {
				zeros += 1
			}
		}
		
		var ones = 0
		var ans = zeros

		for ch in s {
			
			if ch == "0" {
				zeros -= 1
			} else {
				ones += 1
			}
			
			if zeros + ones < ans {
				ans = zeros + ones
			}
		}
		
		return ans
	}
}
