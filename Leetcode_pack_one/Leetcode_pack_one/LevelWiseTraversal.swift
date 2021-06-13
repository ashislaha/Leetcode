//
//  LevelWiseTraversal.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 13/06/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation


class Node {
	let value: Int
	var left: Node?
	var right: Node?
	
	init(value: Int) {
		self.value = value
		self.left = nil
		self.right = nil
	}
}


class BinaryTreeTraversal {
	
	var root: Node?
	
	func bfs(root: Node?) {
		
		guard let root = root else { return }
		
		var Q: [Node?] = []
		
		Q.append(root)
		Q.append(nil)
		
		while !Q.isEmpty {
			
			// remove the first element
			if let processingNode = Q.removeFirst() {
				
				print(processingNode.value)
				
				if let leftNode = processingNode.left {
					Q.append(leftNode)
				}
				if let rightNode = processingNode.right {
					Q.append(rightNode)
				}
				
				if Q.isEmpty {
					return
				}
				
			} else { // it is a nil entry
				Q.append(nil) // marker of the lastly processed level
			}
			
			
		} // end of while
		
		
	} // end of bfs
	
} // end of class
