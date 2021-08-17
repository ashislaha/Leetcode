//
//  Good Nodes in a binary tree.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 17/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class BinaryTreeNode {
	public var val: Int
	public var left: BinaryTreeNode?
	public var right: BinaryTreeNode?
	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: BinaryTreeNode?, _ right: BinaryTreeNode?) {
		self.val = val
		self.left = left
		self.right = right
	}
}
 
class GoodNodesInABinaryTree {
	
	class QNode {
		let node: BinaryTreeNode
		let maxValue: Int
		
		init(_ node: BinaryTreeNode, _  maxValue: Int) {
			self.node = node
			self.maxValue = maxValue
		}
	}
	
	var Q: [QNode] = []
	
	
	func goodNodes(_ root: BinaryTreeNode?) -> Int {
		
		guard let root = root else { return 0 }
		
		Q.append(QNode(root, Int.min)) // insert root
		var results: Int = 0
		
		while !Q.isEmpty {
			
			let deque = Q.removeFirst()
				
			var max = deque.maxValue
			if deque.node.val >= max {
				max = deque.node.val
				results += 1
			}
				
			if let left = deque.node.left {
				Q.append(QNode(left, max))
			}
				
			if let right = deque.node.right {
				  Q.append(QNode(right, max))
			}
			
		}
		
		return results
		
	}
	
}
