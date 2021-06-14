//
//  LongestPalindromeSubstring.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 14/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class LongestPalindromSubstring {
	
	func longestPalindrome(_ s: String) -> String {
		
		guard !s.isEmpty else { return "" }
		
		
		var start = 0
		var length = 0
		
		// build a look up table of [s.count-1][s.count-1] and all are false
		var lookup: [[Bool]] = []
		for _ in 0..<s.count {
			let blankBoolArray = Array<Bool>(repeating: false, count: s.count)
			lookup.append(blankBoolArray)
		}
		
		// consider a single char string, it is palindrome and diagonals should be true
		for i in 0..<s.count {
			lookup[i][i] = true
			start = i
			length = 1
		}
		
		// consider 2 char string, iterate to s.count-2
		for i in 0..<s.count-1 {
			
			let ithString = getString(s, i: i, j: i+1)
			let nextString = getString(s, i: i+1, j: i+2)
			
			if (ithString == nextString) {
				lookup[i][i+1] = true
				start = i
				length = 2
			}
		}
		
		
		// if count is more than 2
		guard s.count > 2 else {
			
			// construct string from start and lenth
			return String(getString(s, i: start, j: start+length))
		}
		
		
		for col in 2..<s.count {
			
			for i in 0..<s.count-col {
				
				let j = i + col
				
				if (getString(s, i: i, j: i+1) == getString(s, i: j, j: j+1)) && lookup[i+1][j-1] {
					lookup[i][j] = true
					
					let diff = col + 1
					if diff > length {
						start = i
						length = diff
					}
					
				}
			}
		}
		return String(getString(s, i: start, j: start + length))
		
	}
	
	func getString(_ s: String, i: Int, j: Int) -> Substring {
		guard i <= j else { return "" }
		let index = s.index(s.startIndex, offsetBy: i)
		let nextIndex = s.index(s.startIndex, offsetBy: j)
		let result = s[index..<nextIndex]
		return result
	}
}
