//
//  ViewController.swift
//  EVA3_7_LISTA-ARCHIVOS
//
//  Created by MIGUEL ANGEL on 11/05/17.
//  Copyright © 2017 MIGUEL ANGEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource{
    var arregloDatos: [String: [String]]!
    var arregloClaves: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let ruta = NSBundle.mainBundle().pathForResource("sortednames", ofType: "plist")
        print(ruta)
        let diccionarioDatos = NSDictionary(contentsOfFile: ruta!)
        arregloDatos = diccionarioDatos as![String: [String]]
        arregloClaves = (diccionarioDatos!.allKeys as! [String]).sort()
        //arregloDatos[arregloClaves[0]]!.append("asdasd")
        //let ruta2 = obtenRuta()
        //let diccionario2 = NSDictionary(dictionary: arregloDatos)
        //diccionario2.writeToURL(ruta2, atomically: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arregloClaves.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let clave = arregloClaves[section]
        let nombresSeccion = arregloDatos[clave]!
        return nombresSeccion.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("celda", forIndexPath: indexPath)  as UITableViewCell
        let clave = arregloClaves[indexPath.section]
        let nombresSeccion = arregloDatos[clave]!
        celda.textLabel?.text = nombresSeccion[indexPath.row]
        return celda
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arregloClaves[section]
    }
    
    func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return arregloClaves
    }
    
    func obtenRuta() -> NSURL {
        let tempDir = NSTemporaryDirectory()
        let tempDirURL = NSURL(fileURLWithPath: tempDir)
        let tempDirFile = tempDirURL.URLByAppendingPathComponent("sortednames.plist")
        return tempDirFile
    }

}

