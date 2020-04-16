//
//  people.swift
//  register
//
//  Created by 陳昱豪 on 2019/11/9.
//  Copyright © 2019 Chen_Yu_Hao. All rights reserved.
//

import Foundation
struct People {
    var name:String
    var birth:Date
    var favorite:String
    var constellation:String
    var account:String
}
struct Song:Identifiable{
    var id=UUID()
    var name:String
    var image:String
    var singer:String
    var lyrics: String
    var url:String=""
}
