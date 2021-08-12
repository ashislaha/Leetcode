//
//  Group Anangrams.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 12/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class GroupAnangrams {
	
	static func test() {
		
		let t = GroupAnagram()
		let r = t.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])
		print(r)
	}
	
	func groupAnagrams(_ strs: [String]) -> [[String]] {
		
		guard !strs.isEmpty else { return [] }
		
		if strs.count == 1 { return [strs] }
		
		var wordSorted: [String] = []
		for each in strs {
			let sortedWord = String(each.sorted())
			wordSorted.append(sortedWord)
		}
		
		var dict: [String: [Int]] = [:] // keep index
		for (index, each) in wordSorted.enumerated() {
			if let value = dict[each] {
				dict[each] = value + [index]
			} else {
				dict[each] = [index]
			}
		}
		
		var results: [[String]] = []
		for (_, value) in dict {
			
			var temp: [String] = []
			for each in value {
				temp.append(strs[each])
			}
			results.append(temp)
		}
		
		return results
		
	}
	
}
