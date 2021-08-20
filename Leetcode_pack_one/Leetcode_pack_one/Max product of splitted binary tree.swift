//
//  Max product of splitted binary tree.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 20/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class MaximumProductOfSplittedBinaryTree {
	
	public class BinarySplittedTreeNode {
		public var val: Int
		public var left: BinarySplittedTreeNode?
		public var right: BinarySplittedTreeNode?
		public init() { self.val = 0; self.left = nil; self.right = nil; }
		public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
		public init(_ val: Int, _ left: BinarySplittedTreeNode?, _ right: BinarySplittedTreeNode?) {
			self.val = val
			self.left = left
			self.right = right
		}
	}
	
	
	func maxProduct(_ root: BinarySplittedTreeNode?) -> Int {
		
		guard let root = root else { return 0 }
		
		// calculate total sum and update the node val
		let total = sumCalculation(root)
		
		// process from root to leaves and find out the max
		var maxValue = Int.min
		let _ = processMaxProduct(root, total, &maxValue)
		
		return maxValue % (Int(pow(10.0, 9)) + 7)
	}
	
	func sumCalculation(_ root: BinarySplittedTreeNode?) -> Int {
		
		guard let root = root else { return 0 }
		
		if root.left == nil && root.right == nil {
			return root.val
		}
		
		return root.val + sumCalculation(root.left) + sumCalculation(root.right)
	}
	
	
	func processMaxProduct(_ root: BinarySplittedTreeNode?, _ total: Int, _ maxValue: inout Int) -> Int {
		
		guard let root = root else { return 0 }
		
		let left = processMaxProduct(root.left, total, &maxValue)
		let right = processMaxProduct(root.right, total, &maxValue)
		
		let sum = left + right + root.val
		maxValue = max(maxValue, (total-sum) * sum)
		return sum
	}
}
