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

/// we are allowing to convert a single "0" to "1" and count the max value of the island
/// an island is constructed using 4-Neighbor structure.
class CombineIslandWithSingleZeroChange {
	
	static func test() {
		
		//		let input = [[0,1,0,0],
		//					 [0,1,1,0],
		//					 [0,1,0,0],
		//					 [1,0,1,0]]
		
		//		let input = [[1,1],
		//					 [1,1]]
		
		let input = [[1,0,0,1,1],
					 [1,0,0,1,0],
					 [1,1,1,1,1],
					 [1,1,1,0,1],
					 [0,0,0,1,0]]
		
		let island = CombineIslandWithSingleZeroChange()
		let output = island.largestIsland(input)
		print(output)
		
	}
	
	func largestIsland(_ grid: [[Int]]) -> Int {
		
		guard grid.count >= 2 else {
			return 1
		}
		
		var grid = grid
		let n = grid.count
		var area: [Int: Int] = [:]
		var gridId: Int = 2
		
		// DO DFS and allocate grid number to "1"
		for i in 0...n-1 {
			for j in 0...n-1 {
				
				if grid[i][j] == 1 {
					DFS(&grid, gridId, i, j)
					gridId += 1
				}
				
			}
		}
		
		// calculate area
		for i in 0...n-1 {
			for j in 0...n-1 {
				
				if grid[i][j] != 0 {
					
					let gridId =  grid[i][j]
					
					if let value = area[gridId] {
						area[gridId] = value + 1
						
					} else {
						// first time entry
						area[gridId] = 1
					}
					
				}
			}
		}
		
		// compute the maxCount if we convert a single "0" to "1"
		// idea is -> check 4-Neighbor and get the area from them.
		// You may encounter duplicate island in 4 neighbor so use a set to remove duplicate
		// count = 1 + (sum of areas in the set's gridId)
		var maxCount = 0
		
		for i in 0...n-1 {
			for j in 0...n-1 {
				
				if grid[i][j] == 0 {
					
					// check all 4 direction and pull the gridId and compute it
					var set: Set<Int> = []
					[(-1,0), (0,-1), (1,0), (0,1)].forEach {
						
						// check the boundary first
						let x = i + $0.0
						let y = j + $0.1
						
						if x >= 0 && x <= n-1 && y >= 0 && y <= n-1 {
							set.insert(grid[x][y])
						}
						
					}
					
					// calculate
					var total = 1 // consider "0" --> "1"
					for each in set {
						if let val = area[each] {
							total += val
						}
					}
					
					if total > maxCount {
						maxCount = total
					}
					
				}
			}
		}
		
		if maxCount == 0 {
			
			// the matrix does not contain 0 at all. everything is 1
			// return the count value
			maxCount = n * n
		}
		
		
		return maxCount
	}
	
	
	func DFS(_ grid: inout [[Int]], _ gridId: Int, _ row: Int, _ col: Int) {
		
		grid[row][col] = gridId
		
		// considering 4 Neighbors.
		let x = [0, 1, 0, -1]
		let y = [1, 0, -1, 0]
		
		for k in 0...3 {
			
			let i = row + x[k]
			let j = col + y[k]
			
			if isSafe(grid, i, j) {
				DFS(&grid, gridId, i, j)
			}
			
		}
		
	}
	
	func isSafe(_ grid: [[Int]], _ row: Int, _ col: Int) -> Bool {
		
		if row < 0 || row > grid.count-1 || col < 0 || col > grid.count-1 { return false }
		
		return grid[row][col] == 1 // "0" and non-One like we discovered already, we can skip it.
		
	}
	
	
}




