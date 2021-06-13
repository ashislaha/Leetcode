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
		
	}
}

