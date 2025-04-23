//
//  String+Extension.swift
//  MedConnect
//
//  Created by Илья Лебедев on 19.04.2025.
//

import Foundation

extension Int {
    var ageCount: String {
        let formatString: String = NSLocalizedString("age", comment: "Count age")
        
        let resultString: String = String.localizedStringWithFormat(formatString, self)
        
        return resultString
    }
}
