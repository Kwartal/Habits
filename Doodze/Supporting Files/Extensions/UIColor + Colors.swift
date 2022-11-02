//
//  Colors.swift
//  Doodze
//
//  Created by Богдан Баринов on 01.11.2022.
//

import Foundation
import UIKit

public class Colors {
    
    /**
     (light: "#FFFFFF", dark: "#000000") Основной цвет фона
     */
    public static let background = UIColor.create(light: "#FFFFFF", dark: "#000000")
    
    /**
     (light: "#262626", dark: "#FFFFFF") Базовый текст
     */
    public static let text = UIColor.create(light: "#262626", dark: "#FFFFFF")
    
    // MARK: - Цвета для ячеек таблицы
    public static let lightRedOrange = UIColor.create(light: "#FFF0F0", dark: "#FF6969")
    public static let lightBlue = UIColor.create(light: "#EFFBFF", dark: "#51C9F8")
    public static let lightGreen = UIColor.create(light: "#F2FFEF", dark: "#85C876")
    public static let lightPurple = UIColor.create(light: "#EFE2FF", dark: "#A864FF")
    public static let lightAqua = UIColor.create(light: "#DBFFFD", dark: "#3CD2C9")
    public static let lightYellow = UIColor.create(light: "#FFF3E4", dark: "#FFB158")
    public static let lightPink = UIColor.create(light: "#FFE4F6", dark: "#FF7FE3")
    
    
    public static func color(by number: Int) -> UIColor {
        switch number {
        case 0: return lightRedOrange
        case 1: return lightBlue
        case 2: return lightGreen
        case 3: return lightPurple
        case 4: return lightAqua
        case 5: return lightYellow
        case 6: return lightPink
        default:
            if number % 7 == 0 {
                return lightRedOrange
            } else if number % 7 == 1 {
                return lightBlue
            } else if number % 7 == 2 {
                return lightGreen
            } else if number % 7 == 3 {
                return lightPurple
            } else if number % 7 == 4 {
                return lightAqua
            } else if number % 7 == 5 {
                return lightYellow
            } else if number % 7 == 6 {
                return lightPink
            } else {
                return .clear
            }
        }
    }
    /**
     Используется для точечных цветов когда нужно кастомное значение альфы например. Должен быть составлен из цветов перечисленных выше
     */
    public static func createCustom(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor.create(light: light, dark: dark)
    }
}
