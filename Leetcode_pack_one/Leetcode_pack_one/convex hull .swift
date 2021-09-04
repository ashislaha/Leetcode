//
//  convex hull .swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 04/09/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class ConvexHull {
	
	class func test() {
		let t = ConvexHull()
		
		let input = [[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]]
		let r = t.outerTrees(input)
		print(r)
	}
	
	/*
		Input: points = [[1,2],[2,2],[4,2]]
		Output: [[4,2],[2,2],[1,2]]
	
		Input: points = [[1,1],[2,2],[2,0],[2,4],[3,3],[4,2]]
		Output: [[1,1],[2,0],[3,3],[2,4],[4,2]]
	**/
	
	// jarvis alogirthm
	func outerTrees(_ points: [[Int]]) -> [[Int]] {
		
		var results: [[Int]] = []
		let N = points.count
		
		if N <= 3 { return points }
		
		// 1. find out the left most element in those points
		var minX = Int.max
		var minIndex: Int = -1
		for (index, each) in points.enumerated() {
			if each[0] < minX {
				minX = each[0]
				minIndex = index
			}
		}
		
		var processingPointIndex = minIndex
		
		repeat {
			results.append(points[processingPointIndex])
			
			// get next 2 points and check whether it is creating a convex polygon
			var q = ( processingPointIndex + 1 ) % N
			
			for (index, each) in points.enumerated() {
				
				// if index is more counter clockwise than q, then update q <-- index
				if isCounterClockWise(points[processingPointIndex], each, points[q]) {
					print("processing \(points[processingPointIndex]) and \(points[q]) --> midPoint --> \(each)")
					q = index
				}
			}
			
			// restore processing point index
			processingPointIndex = q
			
			
		} while(processingPointIndex != minIndex)
		
		return results
	}
	
	func isCounterClockWise(_ point1: [Int], _ point2: [Int], _ point3: [Int]) -> Bool {
		
		let point2_point1_y = Double(point2[1] - point1[1])
		let point2_point1_x = Double(point2[0] - point1[0])
		let point3_point2_y = Double(point3[1] - point2[1])
		let point3_point2_x = Double(point3[0] - point2[0])
		
		let value = point2_point1_y * point3_point2_x - point3_point2_y * point2_point1_x
		// if value == 0 --> colinear
		// if value > 0 then clockwise
		// if value < 0 then anti-clockwise
		
		// the above equation is calcualted based on two angles
		// alpha = (point2_point1_y / point2_point1_x) and beta = (point3_point2_y / point3_point3_x)
		// and alpha < beta for anti-clockwise
		return value < 0
	}
}
