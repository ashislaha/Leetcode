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
		
		let phoneBooth = PhoneBooth()
		let results = phoneBooth.telephoneBooth(digits: "234")
		print(results)
	}
	
	
	func prepare(_ input: String, previousResult: [String]) -> [String] {
		
		var results: [String] = []
		
		for char in input {
			
			if previousResult.isEmpty {
				results.append(String(char))
			} else {
				for str in previousResult {
					results.append(str + String(char))
				}
			}
		}
		
		return results
	}
	
	func telephoneBooth(digits: String) -> [String] {
		
		guard !digits.isEmpty else { return [] }
		
		let map: [String: String] = ["2": "abc",
									 "3": "def",
									 "4": "ghi",
									 "5": "jkl",
									 "6": "mno",
									 "7": "pqrs",
									 "8": "tuv",
									 "9": "wxyz"]
		
		var inputs: [String] = []
		
		// build inputs
		for eachDigit in digits {
			if let mappedString = map[String(eachDigit)] {
				inputs.append(mappedString)
			}
		}
		
		var results: [String] = []
		for each in inputs {
			let intermediateResult = prepare(each, previousResult: results)
			results = intermediateResult
		}
		
		return results
	}
	
}
