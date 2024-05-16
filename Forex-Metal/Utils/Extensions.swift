//
//  Extensions.swift
//  Forex-Metal
//
//  Created by Jay Raval on 2024-05-16.
//

import Foundation

extension Double {
    func convertToString() -> String {
        return String(format: "%.4f", self)
    }
    
    func convertToString2F() -> String {
        return String(format: "%0.2f%%", self)
    }
    
    func forPrice() -> AttributedString {
        let spotRate = self.convertToString()
        let components = spotRate.split(separator: ".")
        
        guard components.count == 2 else {
            return AttributedString(spotRate)
        }
        
        let beforePoint = "\(components[0])."
        let afterPoint = String(components[1])
        
        var attributedString = AttributedString(beforePoint)
        attributedString.font = .customFont(font: .nunito, style: .regular, size: 12)
        
        var afterPointAttributedString = AttributedString(afterPoint)
        afterPointAttributedString.font = .customFont(font: .nunito, style: .bold, size: 14)
        
        attributedString.append(afterPointAttributedString)
        return attributedString
    }
}

extension String {
    func changeDateToTime() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_GB")
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm:ss a"
        let formateDate = dateFormatter.date(from:self)!
        dateFormatter.dateFormat = "HH:mm:ss"
        return "\(dateFormatter.string(from: formateDate))"
    }
}
