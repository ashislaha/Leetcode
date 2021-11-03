//
//  Remove duplicate from list.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 03/11/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class RemoveDuplicateKeysFromList {
	
	class ListNode {
		public var val: Int
		public var next: ListNode?
		public init() { self.val = 0; self.next = nil; }
		public init(_ val: Int) { self.val = val; self.next = nil; }
		public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
	}
	
	func deleteDuplicates(_ head: ListNode?) -> ListNode? {
		
		guard let head = head else { return nil }
		
		var prev: ListNode? = nil
		var current: ListNode? = head
		var next: ListNode? = current?.next
		
		if next == nil {
			return head
		}
		
		var resultHead: ListNode? = nil
		
		while next != nil {
			
			let currentValue = current?.val ?? Int.min
			var nextValue = next?.val ?? Int.min
			
			if currentValue == nextValue {
				
				while currentValue == nextValue {
					next = next?.next
					nextValue = next?.val ?? Int.min
					
				}
				
				if prev != nil {
					prev?.next = next
					current = next
					next = next?.next
				} else {
					current = next
					next = current?.next
					
					if (next == nil) {
						resultHead = current
					}
				}
				
				
			} else {
				
				if prev == nil {
					resultHead = current
				}
				
				prev = current
				current = next
				next = next?.next
				
			}
			
		}
		
		return resultHead
		
	}
}
