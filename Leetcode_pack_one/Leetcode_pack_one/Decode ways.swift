//
//  Decode ways.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 19/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class DecodeDigits {
	
	public static func test() {
		
		let inputs: [String] = [
			"12",
			"226",
			"0",
			"06",
			"1"]
		
		let t = DecodeDigits()
		let input = "2611055971756562"
		let r = t.numDecodings(input)
		print(r)
	}
	
	func numDecodings(_ s: String) -> Int {
		
		guard !s.isEmpty else { return 0 }
		
		// save the char into a dict for better performance in swift
		var dict: [Int: Character] = [:]
		for (index, each) in s.enumerated() {
			dict[index] = each
		}
		
		if dict[0] == "0" { return 0 } // invalid input
		if s.count == 1 && s != "0" { return 1 }
		
		// create a dp array with n element
		let N = s.count
		var dp: [Int] = Array<Int>(repeating: 0, count: N+1)
		dp[0] = 1
		dp[1] = dp[0] // consider a string with single char which is non-zero.
		
		// consider s --> "123" i = 2, consider "2" now
		for i in 2...N {
			// considering i-1 char in the input string and reflecting it in dp[i] table
			
			if dict[i-1]! != "0" {
				// still continuing the same decoding
				dp[i] = dp[i-1]
			}
			
			// if i-2 is 1 then i-2 can be any digit (0...9)
			// if i-1 is 2 then i-2 must be below 7
			// then (i-2, i-1) is another alphabet
			// increment i-1 char processing
			if dict[i-2]! == "1" || (dict[i-2]! == "2" && dict[i-1]! <= "6") {
				dp[i] += dp[i-2]
			}
			
		}
		
		return dp[N]
	}
	
}
