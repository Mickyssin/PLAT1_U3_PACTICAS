//
//  ViewController.swift
//  EVA3_5_PERSITENCIA
//
//  Created by MIGUEL ANGEL on 08/05/17.
//  Copyright © 2017 MIGUEL ANGEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFlDatos: UITextField!
    @IBOutlet weak var lblMostrar: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func btnGuardar(sender: AnyObject) {
        let rutaTem = NSTemporaryDirectory()
        let rutaTempURL = NSURL(fileURLWithPath: rutaTem)
        let archivo = rutaTempURL.URLByAppendingPathComponent("misdatos.txt")
        do{
        try txtFlDatos.text?.writeToURL(archivo, atomically: true, encoding: NSUTF8StringEncoding)
        }catch _ {
            print("Woopsi")
        }
    }

    @IBAction func btnLeer(sender: AnyObject) {
        let rutaTem = NSTemporaryDirectory()
        let rutaTempURL = NSURL(fileURLWithPath: rutaTem)
        let archivo = rutaTempURL.URLByAppendingPathComponent("misdatos.txt")
        do{
            try lblMostrar.text = String(contentsOfFile: archivo.path!, encoding: NSUTF8StringEncoding)
        }catch _ {
            print("Woopsi al leer")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

