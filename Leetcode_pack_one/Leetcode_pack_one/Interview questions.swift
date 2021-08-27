//
//  Interview questions.swift
//  Leetcode_pack_one
//
//  Created by Ashis Laha on 21/08/21.
//  Copyright © 2021 Ashis Laha. All rights reserved.
//

import Foundation



// Q1. check whether a view is intersecting with other views in the view hierarchy?

// Q2. print the view hierarchy into print console.


// Q3.

// create a geometry view with set of points (x,y) where we can add/remove/boundary/getAllPoints() APIs
// We need to maintain 4 heaps for minX, minY, maxY, minY and a set of points to operation on it
// think about thread safely when multiple threads wants to access it. Make it a singleton as it will be accessed multiple places. semaphore.

// find out wrong on below -- value type vs reference type, how optional works on value type (like String?)

class TestInteview {
	
	
	// weak may be applied to class and class bounded protocols, not string
	/* weak */ var testString: String? = "abc"
	

	
}



// Q4.

/*
Visible: [1, 2, 3, 4]

Current list: [1, 2, 3, 4, 5]

New list: [1, 2, 3, 4]
New list 2: [6, 7, 1, 3, 4, 5]



// distinct elements
func difference(_ previous: [Int], _ new: [Int]) -> ([IndexPath], [IndexPath]) {
// [(0,0), (1,0)] [(1, 0)]

// not handling duplicate IDs
var newDict: [Int: Int] = [:]
for (index, each) in new { // O(N)
newDict[each] = index
}

// not handling duplicate IDs
var oldDict: [Int: Int] = [:]
for (index, each) in previous { // O(N)
oldDict[each] = index
}



let previousSet = Set(previous)
let newSet = Set(new)

let newDifference = newSet.symetricDifference(previous) // 6,7, 5
let prviousDiffer = previousSet.symetricDifference(newSet) // 2

var newInsertIndex = [IndexPath]()

// problem -- set is not order-set
for each in newDifference {
	newInsertIndex.append(IndexPath(row: newDict[each]!, section: 0)
}

// delete
var deleteIndex = [IndexPath]()

// problem -- set is not order-set
for each in prviousDiffer {
	deleteIndex.append(IndexPath(row: oldDict[each]!, section: 0)
}

return (newInsertIndex, deleteIndex)
} //time- O(N+M) //space - O(N) + O(M)




func updateTable() {

	let diff = difference(oldlist, newlist)
	
	// update data source
	// we should use the new data-source
	oldlist = newList

	updateSections(diff.1, .remove)
	updateSections(diff.0, .add)
}

func updateSections(_ index: [IndexPath], ops: Operation) {

	table.beginUpdates()

	if ops == .add {
		[-insertItemsAtIndexPaths:]

	} else {
		[-deleteItemsAtIndexPaths:]
	}

	table.ednUpdates()

}

*/


/*

// original rows: [Arizona, California, Delaware, New Jersey, Washington]

   [states removeObjectAtIndex:4]; // Washington --> [Arizona, California, Delaware, New Jersey]
   [states removeObjectAtIndex:2]; // Delaware --> [Arizona, California, New Jersey, Washington]
   
   [states insertObject:@"Alaska" atIndex:0]; --> [Alaska, Arizona, California, New Jersey]
   [states insertObject:@"Georgia" atIndex:3]; --> [Alaska, Arizona, California, Georgia, New Jersey]
   [states insertObject:@"Virginia" atIndex:5]; -> [Alaska, Arizona, California, Georgia, New Jersey, Virginia]

   NSArray *deleteIndexPaths = [NSArray arrayWithObjects:
							   [NSIndexPath indexPathForRow:2 inSection:0],
							   [NSIndexPath indexPathForRow:4 inSection:0],
							   nil];
   NSArray *insertIndexPaths = [NSArray arrayWithObjects:
							   [NSIndexPath indexPathForRow:0 inSection:0],
							   [NSIndexPath indexPathForRow:3 inSection:0],
							   [NSIndexPath indexPathForRow:5 inSection:0],
							   nil];
   UITableView *tv = (UITableView *)self.view;

   [tv beginUpdates];
   [tv insertRowsAtIndexPaths:insertIndexPaths withRowAnimation:UITableViewRowAnimationRight];
   [tv deleteRowsAtIndexPaths:deleteIndexPaths withRowAnimation:UITableViewRowAnimationFade];
   [tv endUpdates];

   // ending rows: Alaska, Arizona, California, Georgia, New Jersey, Virginia


**/

/*

// commit editing

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	
// If row is deleted, remove it from the list.
	if (editingStyle == UITableViewCellEditingStyleDelete) {
		SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
		[controller removeObjectFromListAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
	}
}

- (void)save:sender {
 
	UITextField *textField = [(EditableTableViewTextField *)[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]] textField];
 
	SimpleEditableListAppDelegate *controller = (SimpleEditableListAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSString *newItem = textField.text;
	if (newItem != nil) {
			[controller insertObject:newItem inListAtIndex:[controller countOfList]];
	}
	[self dismissModalViewControllerAnimated:YES];
}
After the modal view is dismissed the table view is reloaded, and it now reflects the added item.



**/

