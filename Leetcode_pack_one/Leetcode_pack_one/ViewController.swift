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
		
	}
}
