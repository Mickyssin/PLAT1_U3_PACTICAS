//
//  ViewController.swift
//  EVA3_6_PERCISTENCIA2
//
//  Created by MIGUEL ANGEL on 09/05/17.
//  Copyright © 2017 MIGUEL ANGEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var misSliders: [UISlider]!

    @IBAction func btnGuardar(sender: AnyObject) {
        //Obtener ruta de directorio a guardar
        let tempDir = NSTemporaryDirectory()
        //Obtener URL
        let tempDirURL = NSURL(fileURLWithPath: tempDir)
        //Nombre del archivo
        let archivo = tempDirURL.URLByAppendingPathComponent("misdatos.txt")
        let arreglo = (misSliders as NSArray).valueForKey("value") as! NSArray
        arreglo.writeToURL(archivo, atomically: true)
    }
    
    @IBAction func btnVisualizar(sender: AnyObject) {
        //Obtener ruta de directorio a guardar
        let tempDir = NSTemporaryDirectory()
        //Obtener URL
        let tempDirURL = NSURL(fileURLWithPath: tempDir)
        //Nombre del archivo
        let archivo = tempDirURL.URLByAppendingPathComponent("misdatos.txt")
        if (NSFileManager.defaultManager().fileExistsAtPath(archivo.path!)){
            if let arreglo = NSArray(contentsOfURL: archivo) as? [Double]{
                var cade = " "
                for i in 0..<arreglo.count{
                    cade = cade + "\(arreglo[i])" + "\n"
                }
                txtVwDatos.text = cade
            }
        }
    }
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var txtVwDatos: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

