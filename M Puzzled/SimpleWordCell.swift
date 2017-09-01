//
//  SimpleWordCell.swift
//  M Puzzled
//
//  Created by Manisha on 31/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit


class SimpleWordCell: FoldingCell{
//	override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
//
//		// durations count equal it itemCount
//		let durations = [0.33, 0.26, 0.26] // timing animation for each view
//		return durations[itemIndex]
//	}
//}
//
//import FoldingCell
//
//class DemoCell: FoldingCell {
	
	@IBOutlet weak var closeNumberLabel: UILabel!
	@IBOutlet weak var openNumberLabel: UILabel!
	
	var number: Int = 0 {
		didSet {
			closeNumberLabel.text = String(number)
			openNumberLabel.text = String(number)
		}
	}
	
	override func awakeFromNib() {
		foregroundView.layer.cornerRadius = 10
		foregroundView.layer.masksToBounds = true
		super.awakeFromNib()
	}
	
	override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
		let durations = [0.26, 0.2, 0.2]
		return durations[itemIndex]
	}
	
}

// MARK: - Actions ⚡️
extension SimpleWordCell {
	
	@IBAction func buttonHandler(_ sender: AnyObject) {
		print("tap")
	}
	
}
