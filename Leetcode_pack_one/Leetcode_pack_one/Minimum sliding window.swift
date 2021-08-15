//
//  Minimum sliding window.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 15/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class MinimumSlidingWindow {
	
	static func test() {
		let t = MinimumSlidingWindow()
		let r = t.minWindow("AAAADABECODEBANC", "ABC") // output --> "ABEC" , "BANC"
		//let r = t.minWindow("ABC", "AC") // output --> "ABC"
		//let r = t.minWindow("BDAB", "AB") // output --> "AB" -- when there is a overlap "BDA", do not clean text
		
		print(r)
	}
	
	func minWindow(_ t: String, _ p: String) -> String {
			
		let M = t.count
		let N = p.count
		
		if M < N { return "" }
		if t == p { return p }
		
		// step -1:
		// create a hash table for pattern
		var pattern: [Character: Int] = [:]
		var text: [Character: Int] = [:]
		
		for each in p {
			if let value = pattern[each] {
				pattern[each] = value + 1
			} else {
				pattern[each] = 1
			}
		}
		
		var start = 0
		var windowSize: Int = M
		var finalString = ""
		var count = 0
		
		for (j, each) in t.enumerated() {
			
			// step -2:
			// create a hash table for text
			if let value = text[each] {
				text[each] = value + 1
			} else {
				text[each] = 1
			}
			
			// increment counter when we find out a char in text which appears in pattern
			// but we should increment till the char frequency matches with pattern, not beyond this.
			if let patternValue = pattern[each], let textValue = text[each], textValue <= patternValue {
				count += 1
			}
			
			if count == N {
				// we find out a window
				// optimise the window
				
				// if the char is not present in pattern, increment the start count
				// if text count value is more than pattern frequency value for that char,
				// increment the start counter and reduce the frequency of text frequency value.
				
				var ch = getValue(t, start)
				while pattern[ch] == nil || text[ch]! > pattern[ch]! {
					
					if let patternChCount = pattern[ch], let textChCount = text[ch], textChCount > patternChCount {
						text[ch] = textChCount - 1
					}
					
					start += 1
					ch = getValue(t, start)
				}
				
				// Now we got a window (j-i+1)
				let len = j - start + 1
				if len <= windowSize {
					windowSize = len
					finalString = substring(t, from: start, to: j)
					print(finalString)
				}
				
			}
		}
		
		return finalString
	}
	
	func getValue(_ s: String, _ i: Int) -> Character {
		let index = s.index(s.startIndex, offsetBy: i)
		return s[index] as Character
	}
	
	func substring(_ s: String, from: Int, to: Int) -> String {
		let index1 = s.index(s.startIndex, offsetBy: from)
		let index2 = s.index(s.startIndex, offsetBy: to)
		return String(s[index1...index2])
	}
	
	
}
