//
//  Non negative intergers without consecutive ones.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 25/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class NonNegativeIntWithoutConsecutiveOnes {
	
	static func test() {
		
		let t = NonNegativeIntWithoutConsecutiveOnes()
		let r = t.findIntegers(5)
		print(r)
	}
	
	var lookup: [Int] = []
	func findIntegers(_ n: Int) -> Int {
		
		let bits = String(n, radix: 2)
		lookup = Array<Int>(repeating: -1, count: bits.count)
		
		var count = 0
		for (index, each) in bits.enumerated() {
			
			// focus on those bits having 1
			if each == "1" {
				
				// TODO:- we need more logic here
				count += fibo(index)
			}
		}
		
		return count
	}
	
	func fibo(_ index: Int) -> Int {
		
		if index <= 1 {
			lookup[index] = index
		}
		
		if lookup[index] == -1 {
			lookup[index] = fibo(index - 1) + fibo(index - 2)
		}
		
		return lookup[index]
	}
	
}
