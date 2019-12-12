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
    case paodock = "PAODOCK_LABEL"
    case galleryCollectionView = "gallery_collection_view"
    case acLogo = "AC_ICON"
    case acBanner = "AC_LOGO_FULL"
    case galleryAccessButton = "gallery_access_button"
    case introTextArea = "firstScreen_textArea"
    case galleryCell = "Cell_" // append index num. Of the cell at the end.
}

extension Accessibility {
    var identifier: String {
        return self.rawValue
    }
}
