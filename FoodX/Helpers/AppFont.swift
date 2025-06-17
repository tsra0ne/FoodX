//
//  AppFont.swift
//  FoodX
//
//  Created by Sravan Goud on 17/06/25.
//

import UIKit

enum AppFont: String {
    case bold = "Sen-Bold"
    case extrabold = "Sen-ExtraBold"
    case medium = "Sen-Medium"
    case regular = "Sen-Regular"
    case semibold = "Sen-SemiBold"
    
    func size(_ size: CGFloat) -> UIFont {
        guard let font = UIFont(name: rawValue, size: size) else {
            fatalError("Font \(rawValue) not found.")
        }
        return font
    }
}
