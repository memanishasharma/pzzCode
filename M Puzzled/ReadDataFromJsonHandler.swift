//
//  ReadDataFromJsonHandler.swift
//  M Puzzled
//
//  Created by Manisha on 29/08/17.
//  Copyright © 2017 Manisha. All rights reserved.
//

import Foundation
class ReadDataFromJsonHandler{
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
				let team = object["typeData"] as? [NSDictionary]
//				for memberDictionary in team! {
//					let member = HomeItem(dictionary: memberDictionary)
//					members.append(member)
//				}
				
				print("team \(team)")
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
