//
//  Category.swift
//  Todo App
//
//  Created by CEMTREX on 09/10/23.
//

import Foundation
import RealmSwift

class Category: Object{
    @objc dynamic var name: String = ""
    let items = List<Item>()
}

