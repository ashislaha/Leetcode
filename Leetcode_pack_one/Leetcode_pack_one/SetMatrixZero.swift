//
//  SetMatrixZero.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 13/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class SetMatrixZero {
	
	func setZeroes(_ matrix: inout [[Int]]) {
		
		guard !matrix.isEmpty else { return }
		
		
		// 1. create a hash table with "rows" and "col" which contains the zero location
		
		// 2. update those rows and columns to zero
		
		var dict: [String: [Int]] = [:]
		let rows = "rows"
		let col = "col"
		
		for i in 0...matrix.count-1 {
			for j in 0...matrix[0].count-1 {
				
				if matrix[i][j] == 0 {
					// update dict
					
					if let rowNumbers = dict[rows] {
						var updatedRows = rowNumbers
						updatedRows.append(i)
						dict[rows] = updatedRows
					} else {
						dict[rows] = [i]
					}
					
					if let colNumbers = dict[col] {
						var updatedcols = colNumbers
						updatedcols.append(j)
						dict[col] = updatedcols
					} else {
						dict[col] = [j]
					}
				}
			}
		} // end of i
		
		guard !dict.isEmpty else { return }
		
		for (key, value) in dict {
			if key == rows {
				for each in value {
					
					for i in 0...matrix[each].count-1 {
						matrix[each][i] = 0
					}
				}
				
			} else { // col
				
				for each in value {
					
					for i in 0...matrix.count-1 {
						matrix[i][each] = 0
					}
				}
			}
		} // end of dict iteration
		
	}
}
