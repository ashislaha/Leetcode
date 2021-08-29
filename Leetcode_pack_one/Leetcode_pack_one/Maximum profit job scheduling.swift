//
//  Maximum profit job scheduling.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 28/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class MaximumProfit {
	
	class Job {
		let startTime: Int
		let endTime: Int
		let value: Int
		
		init(_ start: Int, _ end: Int, _ value: Int) {
			self.startTime = start
			self.endTime = end
			self.value = value
		}
	}
	
	static func test() {
		let t = MaximumProfit()
		
		// set 1
//		let startTime = [1,2,3,3]
//		let endTime = [3,4,5,6]
//		let profit = [50,10,40,70]
		
		// set 2
//		let startTime = [1,2,4,4,7]
//		let endTime = [3,5,6,11,14]
//		let profit = [10,5,12,15,2]
		
		// set 3
//		let startTime = [4,2,4,8,2]
//		let endTime = [5,5,5,10,8]
//		let profit = [1,2,8,10,4]

		// expected = 20 and I am getting output = 17 ( check this)
		let startTime = [24,24,7,2,1,13,6,14,18,24]
		let endTime = [27,27,20,7,14,22,20,24,19,27]
		let profit = [6,1,4,2,3,6,5,6,9,8]
		
		let r = t.jobScheduling(startTime, endTime, profit)
		print(r)
	}
	
	
	func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
		
		guard !startTime.isEmpty &&
				startTime.count == endTime.count &&
				endTime.count == profit.count else { return 0 }
		
		var jobs: [Job] = []
		for i in 0...startTime.count-1 {
			jobs.append(Job(startTime[i], endTime[i], profit[i]))
		}
		
		// sort the job based on their end time
		let sortedJobs = jobs.sorted(by: { $0.endTime < $1.endTime })
		printJobs(sortedJobs)
		
		let maxValue = timeSeriesProfitValue(sortedJobs)
		
		return maxValue
	}
	
	func printJobs(_ jobs: [Job]) {
		for each in jobs {
			print("\(each.startTime) , \(each.endTime), \(each.value)")
		}
	}
	
	func timeSeriesProfitValue(_ jobs: [Job]) -> Int {
		
		var maxValue: Int = Int.min
		
		// we are maintaining a hash-table [timestamp: profit]
		// while processing a job, check its start time and find out the optimal profit till that time.
		// we can do that using binary search
		var lookup: [Int: Int] = [jobs[0].endTime: jobs[0].value]
		
		for i in 1...jobs.count-1 {
			
			let start = jobs[i].startTime
			let end = jobs[i].endTime
			let profit = jobs[i].value
			
			if let nearestStartTime = findSmallestNearestNeighbor(start, sortedArray: jobs) {
				// we found a valid match for current input and it is within range
				lookup[end] = lookup[nearestStartTime]! + profit
			} else {
				
				if let existingValue = lookup[end] {
					lookup[end] = max(existingValue, profit)
					
				} else {
					
					// pull the max value from lookup and test profit with still now max
					if let previous = findPreviousNearestNeighbor(end, sortedArray: jobs) {
						lookup[end] = max(lookup[previous]!, profit)
					} else {
						lookup[end] = profit
					}
				}
			}
		}
		
		// find out the max value from lookup
		for (_, value) in lookup {
			maxValue = max(maxValue, value)
		}
		
		return maxValue
	}
	
	
	func findSmallestNearestNeighbor(_ key: Int, sortedArray: [Job]) -> Int? {
		var low = 0
		var high = sortedArray.count - 1
		
		while low <= high {
			let mid = (low + high)/2
			let midValue = sortedArray[mid].endTime
			
			if midValue == key { // 1. base case
				return sortedArray[mid].endTime
				
			} else if key > midValue {
				low = mid + 1
			} else {
				high = mid - 1
			}
		}
		
		let isWithInRange = low <= sortedArray.count-1 && high >= 0
		return isWithInRange ? sortedArray[high].endTime: nil
	}
	
	
	func findPreviousNearestNeighbor(_ key: Int, sortedArray: [Job]) -> Int? {
		var low = 0
		var high = sortedArray.count - 1
		
		while low <= high {
			let mid = (low + high)/2
			let midValue = sortedArray[mid].endTime
			
			if midValue == key { // 1. base case
				let isWithInRange = mid <= sortedArray.count-1 && mid > 0
				return isWithInRange ? sortedArray[mid - 1].endTime : nil
				
			} else if key > midValue {
				low = mid + 1
			} else {
				high = mid - 1
			}
		}
		
		return nil
	}
	
}
