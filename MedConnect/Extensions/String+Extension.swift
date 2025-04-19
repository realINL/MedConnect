//
//  String+Extension.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import Foundation
 
extension String {
    var firstLetter: String {
        guard let firstChar = self.first else { return "" }
        return String(firstChar)
    }
}
