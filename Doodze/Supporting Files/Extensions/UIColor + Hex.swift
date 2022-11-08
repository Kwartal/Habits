//
//  UIColor + Hex.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import UIKit

extension UIColor {
    convenience init(_ red: Int, _ green: Int, _ blue: Int, _ alpha: CGFloat = 1.0) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / CGFloat(255), green: CGFloat(green) / CGFloat(255), blue: CGFloat(blue) / CGFloat(255), alpha: alpha)
    }

    convenience init(_ white: Int, _ alpha: CGFloat = 1.0) {
        assert(white >= 0 && white <= 255, "Invalid white component")
        self.init(white, white, white, alpha)
    }

    convenience init?(hexString: String) {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }

        if cString.count != 6 {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    var hexString: String? {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        let multiplier: CGFloat = 255

        guard getRed(&red, green: &green, blue: &blue, alpha: &alpha) else { return nil }

        guard alpha == 1 else {
            return String(
                format: "#%02lX%02lX%02lX%02lX",
                lroundf(Float(red * multiplier)),
                lroundf(Float(green * multiplier)),
                lroundf(Float(blue * multiplier)),
                lroundf(Float(alpha * multiplier))
            )
        }

        return String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(red * multiplier)),
            lroundf(Float(green * multiplier)),
            lroundf(Float(blue * multiplier))
        )
    }
}
