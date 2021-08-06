//
//  06-08-21-Level-wise-traversal.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 06/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class LevelWiseTraversal {
	
	// Definition for a Node.
	public class Node {
		public var val: Int
		public var children: [Node]
		public init(_ val: Int) {
			self.val = val
			self.children = []
		}
	}
	
	func levelOrder(_ root: Node?) -> [[Int]] {
		
		guard let root = root else { return [] }
		
		var Q: [Node?] = [root, nil]
		
		var levelResult: [Int] = []
		var result: [[Int]] = []
		
		
		while !Q.isEmpty {
			
			let dequeElement = Q.removeFirst()
			
			if let e = dequeElement {
				
				levelResult.append(e.val)
				
				for each in e.children {
					Q.append(each)
				}
				
				
			} else {
				
				if !Q.isEmpty {
					Q.append(nil)
				}
				
				result.append(levelResult)
				levelResult = [] // reset
			}
			
		}
		
		return result
		
	}
}
