import Foundation
import SwiftUI

// Todo: fix work Color
extension UIColor {
    static let themeColor = UIColor(red: 255/255, green: 249/255, blue: 249/255, alpha: 1)
    static let background = UIColor(red: 255 / 255, green: 252 / 255, blue: 248 / 255, alpha: 1)
    static let primary = UIColor(red: 247 / 255, green: 165 / 255, blue: 17 / 255, alpha: 1)
}

extension Color {
    static let themeColor = Color(UIColor.themeColor)
    static let background = Color(UIColor.background)
    static let primary = Color(UIColor.primary)
}
