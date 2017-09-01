//
//  SimpleWordPuzzleViewController.swift
//  M Puzzled
//
//  Created by Manisha on 29/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit

class SimpleWordPuzzleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
	
	@IBOutlet var tableView: UITableView!
	@IBAction func closeDidTapped(_ sender: Any) {
		self.dismiss(animated: true, completion: nil)
	}
	
	let kCloseCellHeight: CGFloat = 179
	let kOpenCellHeight: CGFloat = 488
	let kRowsCount = 10
	var cellHeights: [CGFloat] = []
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setup()
	}
	
	
	private func setup() {
		cellHeights = Array(repeating: kCloseCellHeight, count: kRowsCount)
		tableView.estimatedRowHeight = kCloseCellHeight
		tableView.rowHeight = UITableViewAutomaticDimension
		//tableView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background"))
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 2
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		guard case let cell as SimpleWordCell = cell else {
			return
		}
		
		cell.backgroundColor = .clear
		
		if cellHeights[indexPath.row] == kCloseCellHeight {
			cell.selectedAnimation(false, animated: false, completion:nil)
		} else {
			cell.selectedAnimation(true, animated: false, completion: nil)
		}
		
		cell.number = indexPath.row
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "FoldingCell", for: indexPath) as! SimpleWordCell
		let durations: [TimeInterval] = [0.26, 0.2, 0.2]
		cell.durationsForExpandedState = durations
		cell.durationsForCollapsedState = durations
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return cellHeights[indexPath.row]
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let cell = tableView.cellForRow(at: indexPath) as! FoldingCell
		
		if cell.isAnimating() {
			return
		}
		
		var duration = 0.0
		let cellIsCollapsed = cellHeights[indexPath.row] == kCloseCellHeight
		if cellIsCollapsed {
			cellHeights[indexPath.row] = kOpenCellHeight
			cell.selectedAnimation(true, animated: true, completion: nil)
			duration = 0.5
		} else {
			cellHeights[indexPath.row] = kCloseCellHeight
			cell.selectedAnimation(false, animated: true, completion: nil)
			duration = 0.8
		}
		
		UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
			tableView.beginUpdates()
			tableView.endUpdates()
		}, completion: nil)
		
	}
}
