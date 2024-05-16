//
//  Extension+Font.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-16.
//

import Foundation
import SwiftUI

extension Font {
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CGFloat,
        isScaled: Bool = true) -> Font {
            
            let fontName: String = font.rawValue + style.rawValue
            
            return Font.custom(fontName, size: size)
        }
}

extension UIFont {
    static func customFont(
        font: CustomFonts,
        style: CustomFontStyle,
        size: CGFloat,
        isScaled: Bool = true) -> UIFont {
            
            let fontName: String = font.rawValue + style.rawValue
            
            guard let font = UIFont(name: fontName, size: size) else {
                debugPrint("Font can't be loaded")
                return UIFont.systemFont(ofSize: size)
            }
            
            return isScaled ? UIFontMetrics.default.scaledFont(for: font) : font
        }
}
