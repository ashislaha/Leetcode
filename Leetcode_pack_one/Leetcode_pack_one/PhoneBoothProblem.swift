//
//  PhoneBoothProblem.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 02/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class PhoneBooth {
	
	static func test() {
		
		// in phone booth - we represent 2 - "abc", 3 - "def", 4 - "ghi" etc.
		
		let inputs = ["abc", "def", "ghi"]
		let phoneBooth = PhoneBooth()
		let results = phoneBooth.telephoneBooth(inputs: inputs)
		print(results)
	}
	
	
	func prepare(_ input: String, previousResult: [String]) -> [String] {
		
		var results: [String] = []
		
		for char in input {
			
			if previousResult.isEmpty {
				results.append(String(char))
			} else {
				for str in previousResult {
					results.append(String(char) + str)
				}
			}
		}
		
		return results
	}
	
	func telephoneBooth(inputs: [String]) -> [String] {
		
		var results: [String] = []
		for each in inputs {
			let intermediateResult = prepare(each, previousResult: results)
			results = intermediateResult
		}
		
		return results
	}
	
}
