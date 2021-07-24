//
//  Binary Tree Pruning.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 24/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class BinaryTreePruning {
	
	// Definition for a binary tree node.
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
	
	func pruneTree(_ root: TreeNode?) -> TreeNode? {
		
		guard let root = root else { return nil }
		
		let rootParent = TreeNode(-1, root, nil)
		preorderPrune(root, parent: rootParent, dir: .left)
		
		if let rootExist = rootParent.left {
			return rootExist
		}
		
		return nil
	}
	
	
	enum Direction {
		case left
		case right
	}
	
	func preorderPrune(_ root: TreeNode, parent: TreeNode, dir: Direction) {
		
		if let leftNode = root.left {
			preorderPrune(leftNode, parent: root, dir: .left)
		}
		if let rightNode = root.right {
			preorderPrune(rightNode, parent: root, dir: .right)
		}
		
		if root.val == 0 && root.left == nil && root.right == nil {
			// delete that node
			switch dir {
			case .left:
				parent.left = nil
			case .right:
				parent.right = nil
			}
		}
	}
	
}
