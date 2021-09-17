//
//  LongestTurbulentArray.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 17/09/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class LongestTurbulentArray {
	
	class func test() {
		let t = LongestTurbulentArray()
		let input = [9,4,2,10,7,8,8,1,9]
		let r = t.maxTurbulenceSize(input)
		print(r)
	}
	
	func maxTurbulenceSize(_ arr: [Int]) -> Int {
		
		guard arr.count > 1 else { return arr.count }
		
		var result = 1
		var start = 0
		var end = 0
		let N = arr.count
		
		while start < N-1 {
			
			if arr[start] == arr[start + 1] {
				start += 1
				continue
			}
			
			end = start + 1
			
			// start processing on end
			while end < N - 1 {
				if isValleyOrMountain(arr, end) {
					end += 1
				} else {
					// not a valley or mountain, break it
					break
				}
			}
			
			// we got a result and update it
			result = max(result, end - start + 1)
			
			// update start
			start = end
			
		}
		
		return result
		
	}
	
	private func isValleyOrMountain(_ arr: [Int], _ k: Int) -> Bool {
		return (arr[k] > arr[k-1] && arr[k] > arr[k+1]) /* mountain */ ||
			(arr[k] < arr[k-1] && arr[k] < arr[k+1]) /* valley */
	}
	
}
