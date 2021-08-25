//
//  Sum of Square numbers.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 25/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class SumOfSquareNumber {
	
	static func test() {
		let t = SumOfSquareNumber()
		let r = t.judgeSquareSum(5)
		print(r)
		
	}
	
	func judgeSquareSum(_ c: Int) -> Bool {
			
			var high = Int(sqrt(Double(c)))
			var low = 0
			var result = false
			
			while low <= high {
				
				let lowSquare = low * low
				let highSquare = high * high
				let sum = lowSquare + highSquare
				
				if sum == c {
					result = true
					break
				} else {
					
					if sum > c {
						high -= 1
					} else {
						low += 1
					}
				}
				
			}
			
			return result
		}
	
}
