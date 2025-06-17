//
//  UIColor+Extension.swift
//  FoodX
//
//  Created by Sravan Goud on 17/06/25.
//

import UIKit

extension UIColor {
    static let customGray = UIColor(red: 100.0/255.0, green: 105.0/255.0, blue: 130.0/255.0, alpha: 1.0)
    
    static let customOrange = UIColor(hex: "#FF7622") ?? .systemOrange
    
    convenience init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Remove '#' if present
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        // Validate length (6 for RGB, 8 for RGBA)
        guard hexString.count == 6 || hexString.count == 8 else { return nil }
        
        var rgbValue: UInt64 = 0
        guard Scanner(string: hexString).scanHexInt64(&rgbValue) else { return nil }
        
        let red, green, blue, alpha: CGFloat
        if hexString.count == 6 {
            // RGB (6 digits)
            red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(rgbValue & 0x0000FF) / 255.0
            alpha = 1.0
        } else {
            // RGBA (8 digits)
            red = CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0
            alpha = CGFloat(rgbValue & 0x000000FF) / 255.0
        }
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
