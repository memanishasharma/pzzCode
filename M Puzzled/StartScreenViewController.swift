//
//  StartScreenViewController.swift
//  M Puzzled
//
//  Created by Manisha on 03/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit


class StartScreenViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
	
	@IBOutlet var tableView: UITableView!
	var data = [["task":"Game",
	            "title":"PlayGame",
		        "image":"titleImage"
		],["task":"Game",
		   "title":"PlayGame",
			"image":"titleImage"
		],["task":"Game",
		   "title":"PlayGame",
			"image":"titleImage"
		],["task":"Game",
		   "title":"PlayGame",
			"image":"titleImage"
		],["task":"Game",
		   "title":"PlayGame",
			"image":"titleImage"
		]]
	
	
	var members: [HomeItem] = []
	var preventAnimation = Set<IndexPath>()
	
	// Mark: - Model
	
	func loadModel() {
		//let path = Bundle.main.path(forResource: "TeamMembers", ofType: "json")
		let path = Bundle.main.url(forResource: "home_item_list", withExtension: "json")
		members = HomeItem.loadMembersFromFile(path!)
	}
	
	// Mark: - View Lifetime
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// appearance and layout customization
		self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
		self.tableView.estimatedRowHeight = 280
		self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.delegate = self
		self.tableView.dataSource = self
		// load our model
		loadModel();
	}
	
	// Mark: - Table View
	
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if !preventAnimation.contains(indexPath) {
			preventAnimation.insert(indexPath)
			TipInCellAnimator.animate(cell)
		}
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return members.count
	}
	
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Card", for: indexPath) as! HomeItemCell
		let member = members[indexPath.row]
		cell.useMember(member)
		return cell
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return false
	}

	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		let storyboard = UIStoryboard(name: "TextPuzzle", bundle: nil)
		if let viewController = storyboard.instantiateViewController(withIdentifier: "MainTableViewController") as? MainTableViewController {
			present(viewController, animated: true, completion: nil)
		}
		
		return nil
	}
	
}
