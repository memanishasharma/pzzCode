//
//  SidePanelViewController.swift
//  M Puzzled
//
//  Created by Manisha on 08/09/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import UIKit

@objc
protocol SidePanelViewControllerDelegate {
	//func animalSelected(animal: Animal)
}

class SidePanelViewController: UIViewController {
	
	//@IBOutlet weak var tableView: UITableView!
	var delegate: SidePanelViewControllerDelegate?
	
	//var animals: Array<Animal>!
	
//	struct TableView {
//		struct CellIdentifiers {
//			static let AnimalCell = "AnimalCell"
//		}
//	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//tableView.reloadData()
	}
	
}

//// MARK: Table View Data Source
//
//extension SidePanelViewController: UITableViewDataSource {
//
//	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//		return 1
//	}
//
//	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		return animals.count
//	}
//
//	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//		let cell = tableView.dequeueReusableCellWithIdentifier(TableView.CellIdentifiers.AnimalCell, forIndexPath: indexPath) as! AnimalCell
//		cell.configureForAnimal(animals[indexPath.row])
//		return cell
//	}
//
//}
//
//// Mark: Table View Delegate
//
//extension SidePanelViewController: UITableViewDelegate {
//
//	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//		let selectedAnimal = animals[indexPath.row]
//		delegate?.animalSelected(selectedAnimal)
//	}
//
//}
//
//class AnimalCell: UITableViewCell {
//
//	@IBOutlet weak var animalImageView: UIImageView!
//	@IBOutlet weak var imageNameLabel: UILabel!
//	@IBOutlet weak var imageCreatorLabel: UILabel!
//
//	func configureForAnimal(animal: Animal) {
//		animalImageView.image = animal.image
//		imageNameLabel.text = animal.title
//		imageCreatorLabel.text = animal.creator
//	}
//
//}

