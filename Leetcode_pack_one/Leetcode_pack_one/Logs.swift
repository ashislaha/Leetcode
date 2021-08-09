//
//  Logs.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 08/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class Logs {
	
	
	func storeItemsTracker2(pricelist: [String], logs: [String]) -> Int {
		
		guard !pricelist.isEmpty else { return 0 }
		
		// convert price list into hashtable
		var prices: [String: Double] = [:]
		for each in pricelist {
			let strings = each.components(separatedBy: ":")
			if strings.count == 2 {
				prices[strings[0]] = Double(strings[1])
			}
			
		}
		
		// sort them based on time-stamp
		var ts: [Int] = []
		
		for each in logs {
			let arrs = each.components(separatedBy: ",")
			if arrs.count > 0 {
				let input = arrs[0]
				let typeAndTs = input.components(separatedBy: " ")
				
				if typeAndTs.count == 2 {
					ts.append(Int(typeAndTs[1])!)
				}
			}
		}
		
		var revisedLogs: [String] = []
		let sortedTS = ts.sorted()
		for value in sortedTS {
			// check its actual index in the original
			if let index = ts.firstIndex(of: value) {
				revisedLogs.append(logs[index])
			}
		}
		
		// go throught one by one in time-stamps and revised operation
		var logs: [Log] = []
		for each in revisedLogs {
			logs.append(Log(each))
		}
		
		let result = processLogs(logs)
		return result
	}
	
	func processLogs(_ logs: [Log]) -> Int {
		return 0
	}
	
}

enum Type: String {
	case supply = "supply"
	case sale = "sell"
	case discount = "discount"
}

class Log {
	let type: Type
	let item: String
	let number: Int
	
	init(_ type: Type, _ item: String, _ number: Int) {
		self.type = type
		self.item = item
		self.number = number
	}
	
	init(_ input: String) {
		type = .discount
		item = "abcd"
		number = 0
	}
	
}
