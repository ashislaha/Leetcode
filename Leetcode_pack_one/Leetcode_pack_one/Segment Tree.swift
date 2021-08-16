//
//  Segment Tree.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 16/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class SegmentTree {
	
	public static func test() {
		
		//let t = SegmentTree([-2,0,3,-5,2,-1])
		
		let t = SegmentTree([-2,0,3,-5,2,-1])
		let r1 = t.findSum(0, 2)
		print(r1) // 1
		let r2 = t.findSum(2, 5)
		print(r2) // -1
		let r3 = t.findSum(0, 5)
		print(r3) // -3
	}
	
	var nums: [Int] = []
	var segments: [Int] = []
	
	init(_ nums: [Int]) {
		self.nums = nums
		
		let logNums = ceil(log2(Double(nums.count)))
		let powerValue = 2 * pow(2, logNums) - 1
		let size = Int(powerValue)
		
		self.segments = Array<Int>(repeating: 0, count: size)
		
		createSegment(low: 0, high: nums.count-1, pos: 0)
	}
	
	private func createSegment(low: Int, high: Int, pos: Int) {
		
		if low == high {
			print("create ---> \(low), \(pos) and \(nums[low])")
			segments[pos] = nums[low]
			return
		}
		
		let mid = (low + high) / 2
		let left = pos * 2 + 1
		let right = pos * 2 + 2
		
		createSegment(low: low, high: mid, pos: left)
		createSegment(low: mid+1, high: high, pos: right)
		
		segments[pos] = segments[left] + segments[right]
	}
	
	public func findSum(_ low: Int, _ high: Int) -> Int {
		return find(low, high, 0, nums.count - 1, 0)
	}
	
	private func find(_ queryLow: Int, _ queryHigh: Int, _ numLow: Int, _ numHigh: Int, _ pos: Int) -> Int {
		
		// if (numLow, numHigh) belongs to (queryLow, queryHigh) then return pos
		// and compare segment partition with respect to query range.
		
		if numLow >= queryLow && numHigh <= queryHigh {
			// total overlap
			return segments[pos]
			
		} else if numHigh < queryLow || numLow > queryHigh {
			// no overlap
			return 0 // as we are looking for sum.
		} else {
			// partial overlap
			
			let mid = (numLow + numHigh) / 2
			let left = find(queryLow, queryHigh, numLow, mid, 2 * pos + 1)
			let right = find(queryLow, queryHigh, mid+1, numHigh, 2 * pos + 2)
			
			return left + right
		}
	}
	
}
