//
//  Spiral matrix.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 17/09/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class SpiralMatrix {
	
	class func test() {
		let t = SpiralMatrix()
		let input = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
		let r = t.spiralOrder(input)
		print(r)
		
	}
	
	func spiralOrder(_ matrix: [[Int]]) -> [Int] {
		
		guard !matrix.isEmpty else { return [] }
		
		let rows = matrix.count
		let columns = matrix[0].count
		
		var left = 0
		var right = columns - 1
		var top = 0
		var bottom = rows - 1
		
		var results: [Int] = []
		while left <= right && top <= bottom {
			
			for i in left...right {
				results.append(matrix[top][i])
			}
			top += 1
			
			if top > bottom { break }
			for i in top...bottom {
				results.append(matrix[i][right])
			}
			
			right -= 1
			
			if left > right { break }
			for i in stride(from: right, through: left, by: -1) {
				results.append(matrix[bottom][i])
			}
			
			bottom -= 1
			
			if top > bottom { break }
			for i in stride(from: bottom, through: top, by: -1) {
				results.append(matrix[i][left])
			}
			
			left += 1
		}
		
		return results
	}
	
}
