//
//  Partition arr.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 07/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


/// partitoing an array into 3 segments so that left <= middle <= right
class PartitionArray {
	
	static func test() {
		let p = PartitionArray()
		//let r = p.countSubsegments(arr: [1,2,2,2,5,0])
		let r = p.countSubsegments(arr: [1, 2, 0])
		
		print(r)
	}
	
	func countSubsegments(arr: [Int]) -> Int64 {
		
		guard arr.count >= 3 else { return 0 }
		
		let N = arr.count
		
		if arr.count == 3 {
			if arr[0] <= arr[1] && arr[1] <= arr[2] {
				return 1
			} else {
				return 0
			}
		}
		
		// another special case when all are 0
		  var isNotZero: Bool = false
		  for each in arr {
			  if each != 0 {
				  isNotZero = true
				  break
			  }
		  }
		  if !isNotZero { // all are 0
			  return Int64((N-4) * (N-3) * (N-2))
		  }
		
		var results: Int64 = 0
		
		// compute result matrix
		var r: [[Int]] = []
		for _ in 0...N-1 {
			let a = Array<Int>(repeating: 0, count: N)
			r.append(a)
		}
		
		for i in 0...N-1 {
			for j in i...N-1 {
				
				if i == j {
					r[i][j] = arr[i]
				} else {
					r[i][j] = r[i][j-1] + arr[j]
				}
				
			}
		}
		
		// split
		for i in 1...N-3 {
			for j in 2...N-2 {
				// spliting at i and j
				let left = r[0][i-1]
				let middle = r[i][j-1]
				let right = r[j][N-1]
				
				if left <= middle && middle <= right {
					results += 1
				}
			}
		}
		
		return results
		
	}
	
}
