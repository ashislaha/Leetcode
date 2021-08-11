//
//  Array of doubled pairs.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 11/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class ArrayOfDoubledPairs {
	
	static func test() {
		
		let t = ArrayOfDoubledPairs()
		//let r = t.canReorderDoubled([4,-2,2,-4])
		let r = t.canReorderDoubled([-5, -2])
		print(r)
	}
	
	func checkHalf(_ dict: inout [Int: Int], _ num: Int) -> Bool {
		
		var result = false
		
		if let value = dict[num] {
			let half = num / 2
			
			if let halfValue = dict[half] {
				// reduce count value
				if value == 1 {
					dict.removeValue(forKey: num)
				} else {
					dict[num] = value - 1
				}
				
				// reduce count value
				if halfValue == 1 {
					dict.removeValue(forKey: half)
				} else {
					dict[half] = halfValue - 1
				}
				
				result = true
			}
		}
		
		return result
	}
	
	func checkDouble(_ dict: inout [Int: Int], _ num: Int) -> Bool {
		
		var result = false
		
		if let value = dict[num] {
			let double = num * 2
			
			if let doubleValue = dict[double] {
				// reduce count value
				if value == 1 {
					dict.removeValue(forKey: num)
				} else {
					dict[num] = value - 1
				}
				
				// reduce count value
				if doubleValue == 1 {
					dict.removeValue(forKey: double)
				} else {
					dict[double] = doubleValue - 1
				}
				
				result = true
			}
		}
		
		return result
	}
	
	
	
	func canReorderDoubled(_ arr: [Int]) -> Bool {
		
		guard !arr.isEmpty else { return true }
		
		let arr = arr.sorted()
		
		// create a set
		var dict: [Int: Int] = [:]
		for each in arr {
			if let value = dict[each] {
				dict[each] = value + 1
			} else {
				dict[each] = 1
			}
		}
		
		
		for each in arr {
			
			if dict[each] == nil { // means it has been processed
				continue
			}
			
			if each >= 0 { // +ve number --> check double as array is sorted
				
				// check double
				let isDouble = checkDouble(&dict, each)
				
				if !isDouble {
					return false
				}
				
			} else {
				// -ve number, check half
				
				// we must not process odd negative number, return false as it must be eliminated before.
				if each % 2 != 0 { return false }
				
				let isHalf = checkHalf(&dict, each)
				
				if !isHalf {
					return false
				}
			}
			
		}
		
		return true
	}
}
