//
//  QuesoController.swift
//  PizzAppW
//
//  Created by Gerardo Villarroel on 27/5/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import WatchKit
import Foundation


class QuesoController: WKInterfaceController {
    
    var eleccionTap = [String]()
    @IBOutlet var eleccion: WKInterfaceLabel!
    @IBOutlet var imagenQueso: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        eleccionTap = context as! Array
        eleccionTap.append("Mozzarella")
        eleccion.setText(eleccionTap[2])
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

    @IBAction func elijeQueso(value: Float) {
        if (value == 0) {
            eleccionTap[2] = "Mozzarella"
            imagenQueso.setImageNamed("Cheese-32 (1)")
        } else if (value == 1) {
            eleccionTap[2] = "Sin Queso"
            imagenQueso.setImageNamed("No-entry-32")
        } else if (value == 2) {
            eleccionTap[2] = "Parmesano"
            imagenQueso.setImageNamed("Cheese-32")
        } else if (value == 3) {
            eleccionTap[2] = "Cheddar"
            imagenQueso.setImageNamed("Folder-32")
        }
        eleccion.setText(eleccionTap[2])
    }

    @IBAction func siguientePaso() {
        let eleccionUsuario = eleccionTap
        pushControllerWithName("ElijeIngredientes", context: eleccionUsuario)
    }
}
