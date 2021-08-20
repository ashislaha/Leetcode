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
		processMaxProduct(root, total, &maxValue)
		
		return maxValue
	}
	
	func sumCalculation(_ root: BinarySplittedTreeNode?) -> Int {
		
		guard let root = root else { return 0 }
		
		if root.left == nil && root.right == nil {
			return root.val
		}
		
		let left = sumCalculation(root.left)
		let right = sumCalculation(root.right)
		let val = root.val + left + right
		root.val = val
		return val
	}
	
	
	func processMaxProduct(_ root: BinarySplittedTreeNode?, _ total: Int, _ maxValue: inout Int) {
		
		guard let root = root else { return }
		
		if let left = root.left {
			maxValue = max(maxValue, (total-left.val) * left.val)
			processMaxProduct(left, total, &maxValue)
		}
		
		if let right = root.right {
			maxValue = max(maxValue, (total-right.val) * right.val)
			processMaxProduct(right, total, &maxValue )
		}
		
	}
}
