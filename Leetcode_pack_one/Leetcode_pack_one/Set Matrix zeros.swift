//
//  Set Matrix zeros.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 13/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class SetMatrixZeros {
	
	public static func test() {
		
		let obj =  SetMatrixZero()
		var matrix = [ [0,1,2,0], [1,2,3,4], [1,3,1,5] ]
		obj.setZeroes(&matrix)
	}
	
	
	// Time complexity O(M*N)
	// space complexity O(1)
	// we have another solution with O(M+N) space, just keep 2 Sets with rows and columns and set them 0
	
	func setZeroes(_ matrix: inout [[Int]]) {
		
		
		var hasRowZero: Bool = false
		var hasColZero: Bool = false
		
		// update first row and colmn
		for i in 0...matrix.count-1 {
			for j in 0...matrix[0].count-1 {
				
				if matrix[i][j] == 0 {
				   
					if i == 0 {
						hasRowZero = true
					}
					
					if j == 0 {
						hasColZero = true
					}
					
					matrix[0][j] = 0 // column is updated
					matrix[i][0] = 0 // row is updated
				}
				
			}
		}
		
		// reset row (except first row)
		for i in 0...matrix.count-1 {
			if matrix[i][0] == 0 && i != 0 {
				
				for j in 0...matrix[i].count-1 {
					matrix[i][j] = 0
				}
			}
		}
		
		// reset col (except first colmn)
		for j in 0...matrix[0].count-1 {
			if matrix[0][j] == 0 && j != 0 {
				
				for i in 0...matrix.count-1 {
					matrix[i][j] = 0
				}
			}
		}
		
		// reset first row and column if needed
		if hasRowZero {
			for i in 0...matrix[0].count-1 {
				matrix[0][i] = 0
			}
		}
		
		if hasColZero {
			for i in 0...matrix.count-1 {
				matrix[i][0] = 0
			}
		}
		
	}
}
