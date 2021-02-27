//
//  PDFText.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 21/02/2021.
//

import Foundation
import UIKit

struct PDFText {
    
    var text : String

    var at : CGRect
    
    var attributes : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)]
    
    func draw(){
        
        self.text.draw(in : at, withAttributes : attributes)
    }
    
}
