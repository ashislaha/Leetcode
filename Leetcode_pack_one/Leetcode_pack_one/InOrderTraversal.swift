//
//  InOrderTraversal.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 18/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class TreeNode {
	let value: Int
	var left: TreeNode?
	var right: TreeNode?
	
	init(value: Int) {
		self.value = value
		self.left = nil
		self.right = nil
	}
}

class InOrderTraversal {
	
	var root: TreeNode?
	
	public func inorder(root: TreeNode?) -> [Int] {
		
		guard let root = root else { return [] }
		
		var result: [Int] = []
		
		let leftArr = inorder(root: root.left)
		if !leftArr.isEmpty {
			result.append(contentsOf: leftArr)
		}
		
		result.append(root.value)
		
		let rightArr = inorder(root: root.right)
		if !rightArr.isEmpty {
			result.append(contentsOf: rightArr)
		}
		
		return result
	}
}
