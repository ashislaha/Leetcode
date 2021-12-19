//
//  Maximal Square.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 19/12/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class MaximalSquare {
	
	static func test() {
		let test = MaximalSquare()
		let input: [[Character]] = [["1","0","1","0","0"],["1","0","1","1","1"],["1","1","1","1","1"],["1","0","0","1","0"]]
		let area = test.maximalSquare(input)
		print(area)
	}
	
	func maximalSquare(_ matrix: [[Character]]) -> Int {
		
		guard !matrix.isEmpty else { return 0 }
		
		let M = matrix.count
		let N = matrix[0].count
		
		// construct a lookup table
		var dp: [[Int]] = []
		
		for _ in 0...M {
			let singleRow = Array<Int>(repeating: 0, count: N+1)
			dp.append(singleRow)
		}
		
		
		var largest = 0
		
		// process the input
		for i in 1...M {
			for j in 1...N {
				
				let input = matrix[i-1][j-1]
				if input == "1" {
					dp[i][j] = min(min(dp[i-1][j-1], dp[i-1][j]), dp[i][j-1]) + 1
					if dp[i][j] > largest {
						largest = dp[i][j]
					}
					
				}
				
				
			}
		}
		
		return largest * largest
		
	}
	
}
