//
//  GroupAnangram.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 20/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class GroupAnagram {
	
	static func groupAnangramTest() {
		
		//Input: strs = ["eat","tea","tan","ate","nat","bat"]
		//Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
		
		let anagram = GroupAnagram()
		
//		let input = ["eat","tea","tan","ate","nat","bat"]
//		let output = anagram.groupAnagrams(input)
//		print(output)
//
//		let input2 = ["","b"]
//		let output2 = anagram.groupAnagrams(input2)
//		print(output2)
//
//		let input3 = ["",""]
//		let output3 = anagram.groupAnagrams(input3)
//		print(output3)
//
		//
		// output -- [["",""],["deer","reed"],["opts","pots","stop","tops"]]
		let input4 = ["stop","pots","reed","","tops","deer","opts",""]
		let output4 = anagram.groupAnagrams(input4)
		print(output4)
	}
	
	func groupAnagrams(_ strs: [String]) -> [[String]] {
		
		guard !strs.isEmpty else { return [[""]] }
		
		guard strs.count > 1 else { return [ [strs[0]] ] }
		
		
		// idea - keep an array of hash-table for distinct anagram
		
		var dictArray: [[Character: Int]] = []
		var results: [[String]] = []
		
		
		for eachStr in strs {
			
			var tempDict: [Character: Int] = [:]
			for eachChar in eachStr {
				if let count = tempDict[eachChar] {
					tempDict[eachChar] = count + 1
				} else {
					tempDict[eachChar] = 1
				}
			}
			
			var match: Bool = false
			var i: Int = 0
			for (index, eachDict) in dictArray.enumerated() {
				
				// both dictionary are empty
				if eachDict.isEmpty && tempDict.isEmpty {
					match = true
					i = index
					break
				}
				
				// both dictionary has different number of items, skip this and move to next dict
				if eachDict.count != tempDict.count {
					continue
				}
				
				for (key, value) in tempDict {
					match = true
					
					// if key does not exist
					if eachDict[key] == nil {
						match = false
						break
					}
					
					if let tempValue = eachDict[key], tempValue != value {
						// this dict does not match, skip to next dict
						match = false
						break
					}
				}
				
				if match {
					// found a matched dictionary
					i = index
					break
				}
			}
			
			if match {
				results[i].append(eachStr)
			} else {
				
				// did not match and adding it result set
				results.append([eachStr])
				dictArray.append(tempDict)
			}
		} // end of for loop
		
		return results
		
	}
}
