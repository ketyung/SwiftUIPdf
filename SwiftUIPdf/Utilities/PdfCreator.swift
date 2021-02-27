//
//  PdfCreator.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 21/02/2021.
//

import PDFKit

class PdfCreator : NSObject {
   
    private  var pageRect : CGRect
    
    private var renderer : UIGraphicsPDFRenderer?

    
    /**
     W: 8.5 inches * 72 DPI = 612 points
     H: 11 inches * 72 DPI = 792 points
     A4 = [W x H] 595 x 842 points
     */
    init(pageRect : CGRect = CGRect(x: 0, y: 0, width: (8.5 * 72.0), height: (11 * 72.0))) {
       
        let format = UIGraphicsPDFRendererFormat()
        let metaData = [
            kCGPDFContextTitle: "It's a PDF!",
            kCGPDFContextAuthor: "TechChee"
          ]
        format.documentInfo = metaData as [String: Any]
        
        self.pageRect = pageRect
        self.renderer = UIGraphicsPDFRenderer(bounds: self.pageRect,
                                             format: format)
        super.init()
    }
    
    deinit {
        
        self.renderer = nil
    }
   
}

extension PdfCreator {
    
    private func addTitle ( title  : String ){
        
        let textRect = CGRect(x: 20, y: 20, // top margin
                              width: pageRect.width - 40 ,height: 40)

        title.draw(in: textRect, withAttributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)])
      
    }
    
    private func addBody (body : String) {
        
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            NSAttributedString.Key.foregroundColor : UIColor.gray
        ]
        
        let bodyRect = CGRect(x: 20, y: 70,
                              width: pageRect.width - 40 ,height: pageRect.height - 80)
        body.draw(in: bodyRect, withAttributes: attributes)
    }
}

extension PdfCreator {
    
    func pdfData( title : String, body: String ) -> Data? {
        
        if let renderer = self.renderer {
       
            let data = renderer.pdfData  { ctx in
                
                ctx.beginPage()
                
                addTitle(title: title)
                
                addBody(body: body)
                
                addWaterMarkAtBottom()
            }
            
            return data

        }
        
        return nil
    }
}

extension PdfCreator {
    
    func pdfDoc( title : String, body: String ) -> PDFDocument? {
        
        if let data = self.pdfData(title: title, body: body){
            
            return PDFDocument(data: data)
        }
        
        return nil
    }
}


extension PdfCreator {
    
    func addWaterMarkAtBottom(){
     
        if let logo = UIImage(named: "techchee_logo") {
   
            let attributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20),
                NSAttributedString.Key.foregroundColor : UIColor.lightGray
            ]
            
            let logoAt = CGRect(x: pageRect.size.width - (logo.size.width + 10), y: pageRect.height - (logo.size.height + 10),
                                width: logo.size.width, height: logo.size.height)
            
            
            let textAt = CGRect (x: logoAt.origin.x - 102, y : logoAt.origin.y + 2, width:100, height: 30 )
            
            let text  = "Created By "
            
            text.draw(in : textAt, withAttributes : attributes)
           
            logo.draw(in: logoAt)
          
        }
    }
    
    
    
}
