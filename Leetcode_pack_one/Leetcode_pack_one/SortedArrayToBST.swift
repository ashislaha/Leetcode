//
//  SortedArrayToBST.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 26/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class SortedArryToBST {
	
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
	
	
	func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
		if nums.isEmpty { return nil }
		
		return BST(0, nums.count-1, nums)
	}
	
	func BST(_ low: Int, _ high: Int, _ nums: [Int]) -> TreeNode? {
		
		if low > high { return nil }
		
		let mid = (low + high) / 2
		let node = TreeNode(nums[mid])
		node.left = BST(low, mid-1, nums)
		node.right = BST(mid+1, high, nums)
		return node
	}
}
