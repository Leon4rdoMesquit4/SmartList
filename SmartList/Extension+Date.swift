//
//  Extension+Date.swift
//  SmartList
//
//  Created by Leonardo Mesquita Alves on 27/10/25.
//

import Foundation

extension Date {
    func slFormatted() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "dd/MM/yy HH:mm:ss"
        return formatter.string(from: self)
    }
}
