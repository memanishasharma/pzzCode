//
//  DumboViewController.swift
//  M Puzzled
//
//  Created by Manisha on 03/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit

class DumboViewController:UIViewController{
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let width:CGFloat = 400
		let height:CGFloat = 500
		
		
		let demoView = DumboBodyView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
		                                      y: self.view.frame.size.height/2 - height/2,
		                                      width: width,
		                                      height: height))
		demoView.backgroundColor = UIColor.white
		
		self.view.addSubview(demoView)
	}
}
