//
//  TresViewController.swift
//  EVA3_2_TABS_DATOS
//
//  Created by MIGUEL ANGEL on 02/05/17.
//  Copyright © 2017 MIGUEL ANGEL. All rights reserved.
//

import UIKit

class TresViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Tres viewDidLoad")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("Tres willAppear")
        //let global = self.tabBarController as! TabBarController
        //global.sCade = "Seleccione Tres"
        let misViewCtrl = self.tabBarController?.viewControllers //Lista de view controllers
        let unoViewController = misViewCtrl![0] as! UnoViewController //Acceder al buscado
        unoViewController.sCade = "Seleccionaste TRES"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
