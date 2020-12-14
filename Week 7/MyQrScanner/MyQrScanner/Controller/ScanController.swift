//
//  ScanController.swift
//  MyQrScanner
//
//  Created by Apple on 1/12/20.
//

import UIKit
import SimpleQRCode

class ScanController: UIViewController{
    
    
    @IBOutlet weak var qrImageview: UIImageView!
    @IBOutlet weak var urlTextFld: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func urlExit(_ sender: Any) {
        let qrCodeC = QRCode(url: URL(string: urlTextFld.text!)!)

        let myImage: UIImage? = try? qrCodeC!.image()
        
        qrImageview.image = myImage;
    }
}
