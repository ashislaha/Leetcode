//
//  Palindrome Partition.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 07/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class PalindromePartition {
	
	static func test() {
		
		let obj = PalindromePartition()
		//let r = obj.minCut("banana")
		let r = obj.minCut("aaaaaaaaaaaaaaaaaaaaaaaa")
		print(r)
		
	}
	
	func minCut(_ s: String) -> Int {
		
		guard !s.isEmpty else { return 0 }
		
		if s.count == 1 { return 0 }
		 if s.count == 2 {
			 if let first = s.first, let last = s.last {
				 return first == last ? 0 : 1
			 }
		 }
		
		
		// step 1 -- compute the dp matrix with True/False
		// whether the [i,j] should be a palindrome or not
		
		let N = s.count
		var dp: [[Bool]] = []
		
		for _ in 0...N-1 {
			let temp = Array<Bool>(repeating: false, count: N)
			dp.append(temp)
		}
		
		// fill up "single" char
		for i in 0...N-1 {
			dp[i][i] = true
		}
		
		// double char
		for i in 0...N-2 {
			if getString(s, i) == getString(s, i+1) {
				dp[i][i+1] = true
			}
		}
		
		for i in 2...N-1 {
			for j in 0...N-1-i {
				
				let row = j
				let col = i+j
				
				if getString(s, row) == getString(s,col) {
					dp[row][col] = dp[row+1][col-1]
				}
			}
		}
		
		if dp[0][N-1] { // the entire string is a palindrome
			return 0
		}
		
		
		// step -2: use the same results to find out the number of cuts
		
		var cuts: [Int] = Array<Int>(repeating: Int.max, count: N)
		cuts[0] = 0 // single char string
		
		for i in 1...N-1 {
			
			if dp[0][i] {
				cuts[i] = 0
				
			} else {
				// find out cuts
				var temp: Int = Int.max
				
				for j in 0...i-1 {
					// we can cut at max j numbers
					
					// if j+1 to i is a palindrome then we can update the cuts value to cuts[j] + 1
					if dp[j+1][i] {
						
						if temp > cuts[j] + 1 {
							temp = cuts[j] + 1
						}
					}
					
				}
				
				cuts[i] = temp
			}
		}
		
		return cuts[N-1]
	}
	
	func getString(_ s: String, _ offset: Int) -> Character {
		let index = s.index(s.startIndex, offsetBy: offset)
		return s[index]
	}
	
	
}
