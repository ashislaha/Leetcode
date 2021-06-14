//
//  ViewController.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 01/05/20.
//  Copyright © 2020 Ashis Laha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let model = EasyOne()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		testLongestPalindromSubstring()
		
		// test find pair
		print(model.findPair(array: [4,2,3,7,2,8,1], target: 5))
		
		
		// 3Sum problem
		let threeSum = ThreeSum()
		print(threeSum.threeSum([-1, 0, 1, 2, -1, -4]))
		print(threeSum.threeSum([0, 1, 1]))
		
		
		// SetMatrixZero
		var inputMatrix = [
			[0,1,2,0],
			[3,4,5,2],
			[1,3,1,5]
		]
		let setMatrixZero = SetMatrixZero()
		setMatrixZero.setZeroes(&inputMatrix);
		
		let binaryTreeTraversal = BinaryTreeTraversal()
		binaryTreeTraversal.root = Node(value: 1)
		binaryTreeTraversal.root?.left = Node(value: 2)
		binaryTreeTraversal.root?.right = Node(value: 3)
		binaryTreeTraversal.root?.left?.left = Node(value: 4)
		binaryTreeTraversal.root?.left?.right = Node(value: 5)
		binaryTreeTraversal.root?.right?.right = Node(value: 6)
		binaryTreeTraversal.bfs(root: binaryTreeTraversal.root)
		
		
	}
	
	private func testLongestPalindromSubstring() {
		let test = LongestPalindromSubstring()
		let r = test.longestPalindrome("babad")
		print(r)
		
		let p = test.longestPalindrome("ccc")
		print(p)
	}
}

