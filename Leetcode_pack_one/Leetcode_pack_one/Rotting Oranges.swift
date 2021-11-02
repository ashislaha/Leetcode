//
//  Rotting Oranges.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 29/10/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class RottingOranges {
	
	class func test() {
		let r = RottingOranges()
		let input1 = [[2,1,1],[1,1,0],[0,1,1]]
		let result = r.orangesRotting(input1)
		print(result)
	}
	
	func orangesRotting(_ grid: [[Int]]) -> Int {
		
		var grid = grid
		let rows = grid.count
		let cols = grid[0].count
		
		var time: Int = 0
		
		
		//  you should find out the first rotten orange and do traversal
		var Q: [(Int, Int)] = []
		var visited: [Int : Bool] = [:]
		
		for i in 0...rows-1 {
			for j in 0...cols - 1 {
				
				if grid[i][j] == 2 {
					
					let index = cols * i + j
					visited[index] = true
					Q.append((i,j))
					break
				}
				
			}
		}
		
		while !Q.isEmpty {
			
			print(Q)
			let item = Q.removeFirst()
			
			var isFreshNeighborPresent = false
			for each in fourNeighborPairs {
				
				let x = each.0 + item.0
				let y = each.1 + item.1
				
				if outOfScope(grid, x, y) {
					continue
				}
				
				let index = cols * x + y
				let isVisited = visited[index] ?? false
				
				if !isVisited && isFreshOrange(grid, x, y) {
					isFreshNeighborPresent = true
					grid[x][y] = 2
					visited[index] = true
					Q.append((x,y))
				}
			}
			
			if isFreshNeighborPresent {
				time += 1
			}
		}
		
		// check all the items so that there should not be any fresh orange
		var isFreshPresent = false
		for i in 0...grid.count-1 {
			for j in 0...grid[0].count - 1 {
				
				if grid[i][j] == 1 {
					
					isFreshPresent = true
					break
				}
				
			}
		}
		
		return isFreshPresent ? -1 : time
		
	}
		
	let fourNeighborPairs: [(Int, Int)] = [(-1,0), (0, -1), (0,1), (1,0),]
	
	func isFreshOrange(_ grid: [[Int]], _ i: Int, _ j: Int) -> Bool {
		
		if outOfScope(grid, i, j) {
			return false
		}
		
		return grid[i][j] == 1
		
	}
	
	func outOfScope(_ grid: [[Int]], _ i: Int, _ j: Int) -> Bool {
		// out of scope
		return i < 0 || i > grid.count-1 || j < 0 || j > grid[0].count - 1
	}
	
}
