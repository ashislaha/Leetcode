//
//  average of levels.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 02/11/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class AverageTreeNode {
	let val: Int
	var left: AverageTreeNode?
	var right: AverageTreeNode?
	
	init(val: Int) {
		self.val = val
		self.left = nil
		self.right = nil
	}
}

class AverageLevels {
	
	var root: AverageTreeNode?
	
	func calculateLevelAvg(root: AverageTreeNode?) {
		guard let root = root else { return }
		
		var Q: [AverageTreeNode?] = []
		
		Q.append(root)
		Q.append(nil)
		
		
		// calcuate average
		var result = 0
		var elements = 0
		
		while !Q.isEmpty {
			let deque = Q.removeFirst()
			
			if let deque = deque {
				result += deque.val
				elements += 1
				
				if let left = deque.left {
					Q.append(left)
				}
				if let right = deque.right {
					Q.append(right)
				}
			} else {
				
				if !Q.isEmpty {
					Q.append(nil)
				}
				
				// calculate and reset
				print(Double(result) / Double(elements))
				result = 0
				elements = 0
			}
		}
	}
	
	static func test() {
		let root = AverageTreeNode(val: 1)
		root.left = AverageTreeNode(val: 2)
		root.right = AverageTreeNode(val: 3)
		root.left?.left = AverageTreeNode(val: 4)
		root.right?.right = AverageTreeNode(val: 5)
		
		let tree = AverageLevels()
		tree.root = root
		tree.calculateLevelAvg(root: root)
	}
}
