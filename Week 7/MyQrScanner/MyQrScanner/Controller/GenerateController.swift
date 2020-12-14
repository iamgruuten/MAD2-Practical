//
//  GenerateController.swift
//  MyQrScanner
//
//  Created by Apple on 1/12/20.
//

import UIKit
import AVFoundation
import QRCoder

class GenerateController: QRCodeScannerViewController {
    
   
    
    //Processing
    override func processQRCodeContent(qrCodeContent: String) -> Bool {
        
        // create the alert
        let alert = UIAlertController(title: "QR Code Info", message: qrCodeContent, preferredStyle: UIAlertController.Style.alert)

                // add the actions (buttons)
                alert.addAction(UIAlertAction(title: "Noted", style: UIAlertAction.Style.default, handler: { _ in
                    
                    self.dismiss(animated: true, completion: nil)
                    self.startQRCodeScanningSession();


                }))

                // show the alert
                self.present(alert, animated: true, completion: nil)


        return true
    }
}
