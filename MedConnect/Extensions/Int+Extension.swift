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
    
    var daysCount: String {
        let formatString: String = NSLocalizedString("days", comment: "days count")
        
        let resultString: String = String.localizedStringWithFormat(formatString, self)
        
        return resultString
    }
    
    var day: String {
        let formatString: String = NSLocalizedString("day", comment: "day")
        
        let resultString: String = "\(self) \(formatString)"
        
        return resultString
    }
    
    var ml: String {
        let formatString: String = NSLocalizedString("ml", comment: "ml")
        
        let resultString: String = "\(self) \(formatString)"
        
        return resultString
    }
    
    var mg: String {
        let formatString: String = NSLocalizedString("mg", comment: "mg")
        
        let resultString: String = "\(self) \(formatString)"
        
        return resultString
    }
    
    var minutesCount: String {
        let formatString: String = NSLocalizedString("minutes", comment: "minutes")
        
        let resultString: String = String.localizedStringWithFormat(formatString, self)
        
        return resultString
    }
    
    var pc: String {
        let formatString: String = NSLocalizedString("pc", comment: "piesces")
        
        let resultString: String = "\(self) \(formatString)"
        
        return resultString
    }
    
    func toDouble() -> Double {
        return Double(self)
    }
}
