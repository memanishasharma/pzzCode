//
//  HomeItem.swift
//  M Puzzled
//
//  Created by Manisha on 20/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation

class HomeItem {
	let imageName: String?
	let title: String?
	let location: String?
	
	init(dictionary:NSDictionary) {
		imageName = dictionary["image"]    as? String
		title     = dictionary["title"]    as? String
		location  = dictionary["level"] as? String
	}
	
	class func loadMembersFromFile(_ path:URL) -> [HomeItem]
	{
		print("path \(path)")
		var members:[HomeItem] = []
		
		do {
			let data = try Data(contentsOf: path)
			let json = try JSONSerialization.jsonObject(with: data, options: [])
			
			if let object = json as? [String:Any]{
				// json is a dictionary
				print(object)
				let team = object["dataList"] as? [NSDictionary]
				for memberDictionary in team! {
					let member = HomeItem(dictionary: memberDictionary)
					members.append(member)
				}
			} else if let object = json as? [Any] {
				// json is an array
				print(object)
			} else {
				print("JSON is invalid")
			}
		}catch{
			print(error.localizedDescription)
		}
		return members
	}
}
