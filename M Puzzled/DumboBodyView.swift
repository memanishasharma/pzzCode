//
//  DumboBodyView.swift
//  M Puzzled
//
//  Created by Manisha on 03/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
import UIKit

class DumboBodyView:UIView{
	
	override init(frame:CGRect){
		super.init(frame:frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		//fatalError("init(coder:) has not been implemented")
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		//custom logic goes here
	}
	
	override func draw(_ rect: CGRect) {
		super.draw(rect)
		
		self.translatesAutoresizingMaskIntoConstraints = false
		let path = UIBezierPath()
		let mid = self.bounds.width/2
		
		let point0 = CGPoint(x: mid-80, y: 100)
		
	    let point1 = CGPoint(x: mid+80, y: 100)
		let point2 = CGPoint(x: mid,y:10)
		
		path.lineWidth = 5
		
		path.move(to: point0)
		path.addQuadCurve(to:point1 , controlPoint: point2)
		
		let point3 = CGPoint(x: mid-80, y: 100)
		
		path.move(to: point3)
		
		let point4 = CGPoint(x: mid,y:200)
		let point5 = CGPoint(x: 0, y: 200)
		path.addQuadCurve(to:point4 , controlPoint: point5)
		
		let point6 = CGPoint(x: mid+80, y: 100)
		path.move(to: point6)
		
		let point7 = CGPoint(x: self.bounds.width, y: 200)
		path.addQuadCurve(to:point4 , controlPoint: point7)
		
		let point8 = CGPoint(x: mid-80,y:200)
		path.move(to: point8)
		
		let point9 = CGPoint(x: mid,y:400)
		let point10 = CGPoint(x: mid-120, y: 300)
		path.addQuadCurve(to:point9 , controlPoint: point10)
		
		let point11 = CGPoint(x: mid+80,y:200)
		path.move(to: point11)
		
		let point12 = CGPoint(x: mid+120, y: 300)
		path.addQuadCurve(to:point9 , controlPoint: point12)
		
		print("point1 \(point0) point1 \(point1) point2 \(point2) point3 \(point3) point4 \(point4) point5 \(point5) point6 \(point6) point7 \(point7) point8 \(point9) point10 \(point10) point11 \(point11) point12 \(point12)" )
		UIColor.yellow.setStroke()
		
		
		let path2 = UIBezierPath(ovalIn: CGRect(x: mid-40,
		                                        y: 140,
		                                        width: 20,
		                                        height: 20))
		let path3 = UIBezierPath(ovalIn: CGRect(x: mid+20,
		                                        y: 140,
		                                        width: 20,
		   
		                                        height: 20))
		path2.stroke()
		UIColor.orange.setFill()
		path2.fill()
		path3.fill()
		path3.stroke()
		
		UIColor.orange.setFill()
		path.fill()
		path.stroke()

		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		self.layer.addSublayer(shapeLayer)
		
		let animation = CABasicAnimation(keyPath: "path")
		animation.duration = 10
		
		animation.fromValue = UIBezierPath(ovalIn: bounds).cgPath
		animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
		
		animation.fillMode = kCAFillModeForwards
		animation.isRemovedOnCompletion = false
		
		shapeLayer.add(animation, forKey: nil)
	}
}
