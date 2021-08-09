//
//  Add strings.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 09/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class AddString {
	
	static func test() {
		let test = AddString()
		//let r = test.addStrings("11", "123")
		let r = test.addStrings("123456789", "987654321")
		print(r)
	}
	
	
	
	func addStrings(_ num1: String, _ num2: String) -> String {
		
		guard !num1.isEmpty || !num2.isEmpty else { return "" }
		
		if num1.isEmpty { return num2 }
		if num2.isEmpty { return num1 }
		
		
		// step -1: reverse the string O(|M| + |N|)
		let n1 = num1.reversed()
		let n2 = num2.reversed()
		let M = num1.count
		let N = num2.count
		
		
		// step - 2: create a linked list / array to save distinct result
		// O(|M| + |N|) - space complexity
		
		var result: [Int] = []
		
		if M > N {
			result = Array<Int>(repeating: 0, count: M)
		} else {
			result = Array<Int>(repeating: 0, count: N)
		}
		
		// if both M and N are same, we must save the last result into last index
		// as there is no place to carry over it.
		
		var arr1: [Int] = []
		var arr2: [Int] = []
		for each in n1 {
			arr1.append(Int(String(each))!)
		}
		for each in n2 {
			arr2.append(Int(String(each))!)
		}
		
		var i = 0
		var j = 0
		var r = 0
		while i < M && j < N {
			let value = arr1[i] + arr2[j] + result[r]
			
			if value >= 10 {
				
				if M == N && i == M-1 {
					result[r] = value
				} else {
					result[r] = value - 10
					result[r+1] = 1
				}
				
			} else {
				result[r] = value
			}
			
			r += 1
			i += 1
			j += 1
		}
		
		while i < M {
			let value = arr1[i] + result[r]
			if value >= 10 {
				
				if i == M-1 {
					result[r] = value
				} else {
					result[r] = value - 10
					result[r+1] = 1
				}
				
			} else {
				result[r] = value
			}
			
			i += 1
			r += 1
		}
		
		while j < N {
			
			let value = arr2[j] + result[r]
			if value >= 10 {
				
				if j == N-1 {
					result[r] = value
				} else {
					result[r] = value - 10
					result[r+1] = 1
				}
				
			} else {
				result[r] = value
			}
			
			j += 1
			r += 1
		}
		
		
		// step-3: combine the result and return it  O(|M| + |N|)
		// overall time complexity is O(|M| + |N|)
		
		let temp = result.reversed()
		var finalResult: String = ""
		for each in temp {
			finalResult += "\(each)"
		}
		
		return finalResult
		
	}
}
