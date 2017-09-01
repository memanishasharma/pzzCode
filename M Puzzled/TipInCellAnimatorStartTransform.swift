//
//  TipInCellAnimatorStartTransform.swift
//  M Puzzled
//
//  Created by Manisha on 20/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

let TipInCellAnimatorStartTransform:CATransform3D = {
	let rotationDegrees: CGFloat = -15.0
	let rotationRadians: CGFloat = rotationDegrees * (CGFloat(Double.pi)/180.0)
	let offset = CGPoint(x: -20, y: -20)
	var startTransform = CATransform3DIdentity
	startTransform = CATransform3DRotate(CATransform3DIdentity,
	                                     rotationRadians, 0.0, 0.0, 1.0)
	startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
	
	return startTransform
}()

class TipInCellAnimator {
	class func animate(_ cell:UITableViewCell) {
		let view = cell.contentView
		
		view.layer.transform = TipInCellAnimatorStartTransform
		view.layer.opacity = 0.8
		
		UIView.animate(withDuration: 0.4, animations: {
			view.layer.transform = CATransform3DIdentity
			view.layer.opacity = 1
		}) 
	}
}
