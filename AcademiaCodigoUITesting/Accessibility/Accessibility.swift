//
//  Accessibility.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 11/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//

import Foundation

enum Accessibility: String {

    case title = "title"
}

extension Accessibility {

    var identifier: String {
        return self.rawValue
    }
}
