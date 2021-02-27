//
//  ViewController.swift
//  SwiftUIPdf
//
//  Created by Chee Ket Yung on 23/02/2021.
//

import UIKit
import PDFKit

class ViewController : UIViewController {
    
    private var data : Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPdfView()
        createShareButton()
    }
    
    
    private func createPdfView(){
        
        let pdfMetaData = [kCGPDFContextCreator: "My First PDF File",
        kCGPDFContextAuthor: "TechChee.com"]

        let format = UIGraphicsPDFRendererFormat()
        format.documentInfo = pdfMetaData as [String: Any]

        let pageRect = CGRect(x:0, y:0, width: 500, height: 600)
        
    
        let renderer = UIGraphicsPDFRenderer(bounds:pageRect , format: format)
        
        
        self.data = renderer.pdfData{ context in
            context.beginPage() // call it when you need to start a new page
            let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]

            let text = "My First PDF file"
            text.draw(in : CGRect(x: 20, y: 30, width: 300, height: 50), withAttributes: attributes)

            if let image = UIImage(named: "techchee_logo"){
                // loop to draw 12 images
                for i in (0 ..< 12){
               
                    let y : CGFloat = 100 + (image.size.height * CGFloat(i)) + (10 * CGFloat(i))
                    let num = "\(String(format: "%02d", i+1)) "
                    num.draw(in: CGRect(x: 20, y : y + 3 , width: 30, height: 30),
                             withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)])
                    image.draw(in: CGRect(x: 60, y : y, width: image.size.width , height: image.size.height) )
                }
            }
        }
       
        if let data = self.data {
  
            let pdfView = PDFView(frame: CGRect(x: 10, y : 10, width: self.view.frame.size.width - 20,
                                                height: self.view.frame.size.height * 0.6))
            pdfView.autoScales = true 
            pdfView.document = PDFDocument(data: data)
            
            self.view.addSubview( pdfView )
      
        }
    }
    

    
    
    private func createShareButton() {
        

        let y = (self.view.frame.height * 0.6) + 20
        let button:UIButton = UIButton(frame: CGRect(x: (self.view.frame.size.width - 200) / 2, y: y , width: 200, height: 50))
        button.backgroundColor = .black
        button.setTitle("Share", for: .normal)
        button.addTarget(self, action:#selector(self.shareButtonClicked), for: .touchUpInside)
        self.view.addSubview(button)
        
    }

    
    @objc private func shareButtonClicked() {
        
        if let data = data {
       
            let sharer = UIActivityViewController(activityItems: [data], applicationActivities: nil)
            self.present(sharer, animated:true)
        }
      
    }

}
