//
//  FontExtension.swift
//  iPing
//
//  Created by kakao on 2020/05/23.
//  Copyright © 2020 changman. All rights reserved.
//

import Foundation
import SwiftUI


extension Font {
    enum FontType: String {
        case NOTO = "NotoSansCJKjp"
        case GIL = "Gilroy"
    }
    
    
    enum WeightType: String {
        case REGULAR = "Regular"
        case LIGHT = "Light"
        case MEDIUM = "Medium"
    }
    
    static func getCustom(type: FontType, size: CGFloat, weight: WeightType) -> Font {
        let fontName = "\(type.rawValue)-\(weight.rawValue)"
        return Font.custom(fontName, size: size)
    }
}
