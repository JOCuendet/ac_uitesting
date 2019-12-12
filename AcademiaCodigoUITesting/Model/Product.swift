//
//  Product.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//
import Foundation
import UIKit

struct Product: Codable{
    let id: Int
    let url: String
    let title: String
    let descrip: String
    let vegan: Bool
    let vegetarian: Bool
}

typealias product = [Product]

