//
//  ReverseNodeInKGroup.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 19/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class ReverseNodeInKGroup {
	
	static func test() {
		
		let reverseNode = ReverseNodeInKGroup()
		
		let head: ListNode? = ListNode(1)
		// create a list
		var current = head
		[2,3,4,5].forEach {
			current?.next = ListNode($0)
			current = current?.next
		}
		
		let result = reverseNode.reverse(head, 2)
		
		var temp = result
		while temp != nil {
			print(temp?.val ?? -1)
			temp = temp?.next
		}
	}
	
	
	
	public class ListNode {
		public var val: Int
		public var next: ListNode?
		public init() { self.val = 0; self.next = nil; }
		public init(_ val: Int) { self.val = val; self.next = nil; }
		public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
	}

	
	func reverse(_ head: ListNode?, _ k: Int)-> ListNode? {
		
		if head == nil { return nil }
		
		// if the list has less number of nodes than k, nothing to do
		// count the list node as it will help us to compute a specific node and do reverse
		
		var count = 0
		var tempHead = head
		while tempHead != nil {
			count += 1
			tempHead = tempHead?.next
		}
		
		
		// check count > k
		if count <= k || k == 1 {
			return head
		}
		
		// calculate repeatation
		let repeats = count / k
		var i = 1
		
		
		var beginIterationNode = head
		var previousIterationLastNode = head
		var resultRoot: ListNode? = nil
		
		while i <= repeats {
			
			
			var previous: ListNode? = nil
			var current: ListNode? = beginIterationNode
			var next: ListNode? = current?.next
			let tempCurrentIterationStartNode = current
			
			
			var j = 1
			while j <= k {
				current?.next = previous
				previous = current
				current = next
				next = next?.next
				j += 1
			}
			
			if i == 1 {
				// previous should be the new root node of the result
				resultRoot = previous
			}
			
			
			// update previous to beginIteration
			beginIterationNode = current
			
			// update lastiteration node to next
			if i == repeats {
				// we reach to last iteration
				previousIterationLastNode?.next = current
			} else {
				// iterate to next iteration last node and update it
				var nextItLastNode = current
				var t = 1
				while t < k {
					nextItLastNode = nextItLastNode?.next
					t += 1
				}
				previousIterationLastNode?.next = nextItLastNode
			}
			
			previousIterationLastNode = tempCurrentIterationStartNode
			
			i += 1
		}
	
		return resultRoot
		
	}
}

