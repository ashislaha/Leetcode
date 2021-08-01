//
//  Large island.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 01/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class LargeIsland {
	
	static func test() {
		
		var input = [[0,1,0,0],
					 [0,1,1,0],
					 [0,1,0,0],
					 [1,0,1,0]]
		
		let island = LargeIsland()
		let output = island.findOutLargeIsland(&input)
		print(output)
		
	}
	
	
	// it can give us the number of island and the largetst island value
	func findOutLargeIsland(_ grid: inout [[Int]]) -> (Int, Int) {
		
		var gridId: Int = 2
		let n = grid.count
		
		var area: [Int: Int] = [:] // gridid: area
		
		for i in 0...n-1 {
			for j in 0...n-1 {
				
				if grid[i][j] == 1 {
					DFS(&grid, gridId, i, j)
					gridId += 1
				}
				
			}
		}
		
		for i in 0...n-1 {
			for j in 0...n-1 {
				
				let val = grid[i][j]
				
				if val != 0 {
					
					// it is a part of island
					if let numerOfIsland = area[val] {
						area[val] = numerOfIsland + 1
					} else {
						area[val] = 1
					}
					
				}
			}
		}
		
		// find out the max from it
		let numberofIsland = gridId - 2
		var maxCount = 0
		for (_, value) in area {
			if value > maxCount {
				maxCount = value
			}
		}
		
		return (numberofIsland, maxCount)
	}
	
	func DFS(_ grid: inout [[Int]], _ gridId: Int, _ row: Int, _ col: Int) {
		
		grid[row][col] = gridId // update its identity
		
		// 8 neighbor -- for k in 0...1 { ... }
		let x = [-1, -1, -1, 0, 0, 1, 1, 1]
		let y = [-1, 0, 1, -1, 1, -1, 0, 1]

		// 4 neighbor -- do not consider diagonal one -- for k in 0...1
//		let x = [0, 1]
//		let y = [1, 0]
		
		for k in 0...7 {
			
			let i = row + x[k]
			let j = col + y[k]
			
			if isSafe(grid, i, j) {
				DFS(&grid, gridId, i, j)
			}
		}
	}
	
	func isSafe(_ grid: [[Int]], _ row: Int, _ col: Int) -> Bool {
		
		if row < 0 || row > grid.count-1 || col < 0 || col > grid.count-1 || grid[row][col] == 0 { return false }
		return  grid[row][col] == 1
	}
	
}

