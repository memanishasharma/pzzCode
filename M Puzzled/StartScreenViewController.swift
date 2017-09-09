//
//  StartScreenViewController.swift
//  M Puzzled
//
//  Created by Manisha on 03/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit

@objc
protocol CenterViewControllerDelegate {
	@objc optional func toggleLeftPanel()
	@objc optional func toggleRightPanel()
	@objc optional func collapseSidePanels()
}
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
	var delegate: CenterViewControllerDelegate?
	
	// Mark: - Model
	func loadModel() {
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
		for family: String in UIFont.familyNames
		{
			print("\(family)")
			for names: String in UIFont.fontNames(forFamilyName: family)
			{
				print("== \(names)")
			}
		}
	}
	
	// Mark: - Table View
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//		if !preventAnimation.contains(indexPath) {
//			preventAnimation.insert(indexPath)
//			TipInCellAnimator.animate(cell)
//		}
		TipInCellAnimator.animate(cell)
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
		switch indexPath.row % 6 {
		case 0:
			cell.cardBg.backgroundColor = UIColor.FlatColor.materialColor.C3
			cell.mainView.backgroundColor = UIColor.FlatColor.materialColor.C3.withAlphaComponent(0.6)
			break
		case 1:
			cell.cardBg.backgroundColor = UIColor.FlatColor.materialColor.GreenSea
			cell.mainView.backgroundColor = UIColor.FlatColor.materialColor.GreenSea.withAlphaComponent(0.6)
			break
		
		case 2:
			cell.cardBg.backgroundColor = UIColor.FlatColor.materialColor.C1
			cell.mainView.backgroundColor = UIColor.FlatColor.materialColor.C1.withAlphaComponent(0.6)
			break
		
		case 3:
			cell.cardBg.backgroundColor = UIColor.FlatColor.materialColor.BelizeHole
			cell.mainView.backgroundColor = UIColor.FlatColor.materialColor.BelizeHole.withAlphaComponent(0.6)
			break
		case 4:
			cell.cardBg.backgroundColor = UIColor.FlatColor.materialColor.Turquoise
			cell.mainView.backgroundColor = UIColor.FlatColor.materialColor.Turquoise.withAlphaComponent(0.6)
			break
		case 5:
			cell.cardBg.backgroundColor = UIColor.FlatColor.materialColor.Alizarin
			cell.mainView.backgroundColor = UIColor.FlatColor.materialColor.Alizarin.withAlphaComponent(0.6)
			break
		default:
			break
		}
		cell.mainView.drawBorder()
		cell.cardBg.drawBorder()
		cell.cardBg.dropShadow()
		return cell
	}
	
	func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	
	func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
		//let storyboard = UIStoryboard(name: "TextPuzzle", bundle: nil)
		//		if let viewController = storyboard.instantiateViewController(withIdentifier: "MainTableViewController") as? MainTableViewController {
		//			present(viewController, animated: true, completion: nil)
		//		}
		let cell = self.tableView.cellForRow(at: indexPath) as! HomeItemCell
		if cell.nameLabel.text == "MYSTERY SOLVER"{
			let storyboard = UIStoryboard(name: "Mystery", bundle: nil)
			if let viewController = storyboard.instantiateViewController(withIdentifier: "MysteryViewController") as? MysteryViewController {
				present(viewController, animated: true, completion: nil)
			}
		}else if cell.nameLabel.text == "WORD GEEK"{
			let storyboard = UIStoryboard(name: "Mystery", bundle: nil)
			if let viewController = storyboard.instantiateViewController(withIdentifier: "MysteryViewController") as? MysteryViewController {
				present(viewController, animated: true, completion: nil)
			}
		}
		
		return nil
	}
	
	
	
}
