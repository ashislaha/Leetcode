//
//  StoneGame1.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 05/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class Solution {
	
	var dp: [[Int]] = [] // it can be size of N*N
	
	func stoneGameUtils(_ piles: [Int], _ low: Int, _ high: Int) -> Int {
		
		if low > high {
			return 0
		}
		
		if dp[low][high] != -1 { return dp[low][high] }
		
		dp[low][high] = max(piles[low] - stoneGameUtils(piles, low+1, high),
					   piles[high] - stoneGameUtils(piles, low, high - 1) )
		
		// Lee move --> stoneGameUtils(piles, low+1, high) or stoneGameUtils(piles, low, high - 1)
		return dp[low][high]
	}
	
	func stoneGame(_ piles: [Int]) -> Bool {
		
		let N = piles.count
		for _ in 0...N-1 {
			let temp = Array<Int>(repeating:-1, count: N)
			dp.append(temp)
		}
		
		return stoneGameUtils(piles, 0, N-1) > 0
	}
	
}
