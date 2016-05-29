//
//  InterfaceController.swift
//  PizzAppW WatchKit Extension
//
//  Created by Gerardo Villarroel on 27/5/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    var eleccionTap = [String]()
    @IBOutlet var eleccion: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        eleccionTap.append("Pequeña")
        eleccion.setText(eleccionTap[0])
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func elijeTamaño(value: Float) {
        if (value == 0) {
            eleccionTap[0] = "Pequeña"
        } else if (value == 1) {
            eleccionTap[0] = "Mediana"
        } else if (value == 2) {
            eleccionTap[0] = "Grande"
        }
        eleccion.setText(eleccionTap[0])
    }

    @IBAction func SiguientePaso() {
        let eleccionUsuario = eleccionTap
        pushControllerWithName("ElijeMasa", context: eleccionUsuario)
    }
}
