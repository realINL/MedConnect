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
    
    var firstWord: String {
        let components = self.components(separatedBy: " ")
        return components.first ?? ""
    }
    
    func nFirstWords(_ n: Int) -> String {
        let components: [String] =  self.components(separatedBy: " ")
        
        guard n > 0 && components.count >= n else { return self }
               
        return components[0..<n].joined(separator: " ")    }
}
