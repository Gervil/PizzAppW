//
//  MasaController.swift
//  PizzAppW
//
//  Created by Gerardo Villarroel on 27/5/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import WatchKit
import Foundation


class MasaController: WKInterfaceController {

    var eleccionTap = [String]()
    @IBOutlet var eleccion: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        eleccionTap = context as! Array
        eleccionTap.append("Delgada")
        eleccion.setText(eleccionTap[1])
        print(eleccionTap)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func elijeMasa(value: Float) {
        if (value == 0) {
            eleccionTap[1] = "Delgada"
        } else if (value == 1) {
            eleccionTap[1] = "Crujiente"
        } else if (value == 2) {
            eleccionTap[1] = "Gruesa"
        }
        eleccion.setText(eleccionTap[1])
    }
    
    @IBAction func siguientePaso() {
        let eleccionUsuario = eleccionTap
        pushControllerWithName("ElijeQueso", context: eleccionUsuario)
    }
}
