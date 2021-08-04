//
//  Path Sum.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 04/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class PathSum {
	
	public class TreeNode {
		public var val: Int
		public var left: TreeNode?
		public var right: TreeNode?
		public init() { self.val = 0; self.left = nil; self.right = nil; }
		public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
		public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
			self.val = val
			self.left = left
			self.right = right
		}
	}
	
	
	func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
		
		guard let root = root else { return [] }
		
		var result: [[Int]] = []
		
		pathSumUtils(root, targetSum, [], &result)
		return result
	}
	
	func pathSumUtils(_ root: TreeNode, _ target: Int, _ arr: [Int], _ result: inout [[Int]]) {
		
		var processedArr = arr
		processedArr.append(root.val)
		
		if root.left == nil && root.right == nil {
			// reached to leaf
			if root.val == target {
				result.append(processedArr)
			}
			
		} else {
			
			if let left = root.left {
				pathSumUtils(left, target-root.val, processedArr, &result)
			}
			
			if let right = root.right {
				pathSumUtils(right, target-root.val, processedArr, &result)
			}
			
		}
	}
}
