//
//  Word Ladder.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 25/07/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation

class WordLadder {
	
	static func test() {
		
		let t = WordLadder()
		let words = ["hot","dot","dog","lot","log","cog"]
		let r = t.findLadders("hit", "cog", words)
		print(r)

		let words2 = ["a","b","c"]
		let r2 = t.findLadders("a", "b", words2)
		print(r2)
	}
	
	
	func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
		
		// edge-cases
		// both beginWord and endWord should be non-empty and same char number
		guard beginWord.count == endWord.count else { return [] }
		
		
		// if wordList is empty then
		// there should be single char difference between beginword and endword, otherwise it is empty
		if wordList.isEmpty {
			if isSingleCharDiff(beginWord, dest: endWord) {
				return [[beginWord, endWord]]
			}
			return []
		}
		
		var totalList = wordList + [beginWord] + [endWord]
		
		// filter it out if any duplicate entries are there
		let wordsSet = Set(totalList)
		totalList = Array<String>(wordsSet)
		
		
		
		// create adjacent list
		let adjacentList: [String: [String]] = computeAdjacentList(totalList)
		
		// visited nodes
		// should not update endWord as visited
		var visited: [String: Bool] = [:]
		
		// keep track of nodes who is discovered by whom
		// we must not update beginWord in parent so that it is still nil
		var parent: [String: String] = [:]
		
		var results: [[String]] = []
		
		
		// DO BFS
		var Q: [String] = []
		Q.append(beginWord)
		visited[beginWord] = true
		
		while !Q.isEmpty {
			
			let processedItem = Q.removeFirst()
			
			// check it's adjacent list
			if let adjNodes = adjacentList[processedItem],
			   !adjNodes.isEmpty {
				
				for each in adjNodes {
					
					if visited[each] == true { continue }
					
					// continue if it is nil(source node) or not-visited
					if each == endWord {
						// we found a match
						// backtrack and update results
						
						var temp: [String] = [endWord, processedItem]
						
						var item = processedItem
						while parent[item] != nil {
							temp.append(parent[item]!)
							item = parent[item]!
						}
						
						results.append(temp.reversed()) // need to reverse the result
						
					} else {
						
						visited[each] = true
						parent[each] = processedItem
						Q.append(each)
					}
					
				} // end of for loop in adj
				
			}
			
		} // end of Q
		
		if results.count > 1 {
			
			// as we are returning shorted travelled time. filter it out
			var finalResult: [[String]] = []
			
			var minIndex = 0
			
			for i in 1..<results.count {
				
				if results[i].count <= results[minIndex].count {
					finalResult.append(results[i])
					minIndex = i
				}
			}
			
			if finalResult.isEmpty {
				// first element is the min one
				finalResult.append(results[0])
			} else if finalResult[0].count == results[0].count {
				finalResult.append(results[0])
			}
			
			// update results
			results = finalResult
		}
		
		return results
	}
	
	
	
	private func isSingleCharDiff(_ source: String, dest: String) -> Bool {
		
		guard source.count == dest.count else { return false }
		
		var isDiffCount = 0
		for i in 0...source.count-1 {
			let index = source.index(source.startIndex, offsetBy: i)
			if source[index] != dest[index] {
				isDiffCount += 1
			}
		}
		
		return isDiffCount == 1
	}
	
	private func computeAdjacentList(_ words: [String]) -> [String: [String]] {
		
		var result: [String: [String]] = [:]
		
		for i in 0...words.count-1 {
			
			var temp: [String] = []
			
			for j in 0...words.count-1 {
				
				if isSingleCharDiff(words[i], dest: words[j]) {
					temp.append(words[j])
				}
				
			}
			
			result[words[i]] = temp
		}
		
		return result
	}
	
	
}
