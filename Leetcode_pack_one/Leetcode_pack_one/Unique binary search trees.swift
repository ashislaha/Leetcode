//
//  Unique binary search trees.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 02/09/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class UniqueBinaryTrees {
	func generateTrees(_ n: Int) -> [TreeNode?] {
		  return generateTreesUtils(1,n)
	}
	
	func generateTreesUtils(_ start: Int, _ end: Int) -> [TreeNode?] {
		if start > end { return [nil] }
		
		var results: [TreeNode?] = []
		for i in start...end {
			let left = generateTreesUtils(start, i-1)
			let right = generateTreesUtils(i+1, end)
			
			for eachLeft in left {
				for eachRight in right {
					
					let rootNode = TreeNode(value: i)
					rootNode.left = eachLeft
					rootNode.right = eachRight
					results.append(rootNode)
				}
			}
		}
		
		return results
	}
}
