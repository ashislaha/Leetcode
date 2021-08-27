//
//  Longest uncommon subsequence.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 27/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class LongestUncommonSequece {
	
	static func test() {
		
		let t = LongestUncommonSequece()
		let inputs = ["aba","cdc","eae"] // 3
		let anotherInputs = ["aaa","aaa","aa"] // -1
		let r1 = t.findLUSlength(inputs)
		let r2 = t.findLUSlength(anotherInputs)
		print(r1, r2)
	}
	
	func findLUSlength(_ strs: [String]) -> Int {
		
		var result = -1
		
		for i in 0...strs.count-1 {
			
			var isSubsequence = false
			for j in 0...strs.count-1 {
				
				if i == j { continue }
				
				if subsequence(strs[i], strs[j]) {
					isSubsequence = true
					break
				}
				
			}
			
			// did not get a subsequcne, update result
			if !isSubsequence {
				result = max(result, strs[i].count)
			}
			
		}
		
		return result
		
	}
	
	func subsequence(_ first: String, _ second: String) -> Bool {
		
		if first == second { return true }
		
		let firstDict = getDict(first)
		let secondDict = getDict(second)
		
		var i = 0
		var j = 0
		let M = first.count
		let N = second.count
		
		while i < M && j < N {
			if firstDict[i] == secondDict[j] {
				i += 1
			}
			j += 1
			
		}
		
		if i == M { return true } // found a subsequence
		
		return false
		
	}
	
	func getDict(_ input: String) -> [Int: Character] {
		var dict: [Int: Character] = [:]
		
		for (index, value) in input.enumerated() {
			dict[index] = value
		}
		
		return dict
	}
	
}
