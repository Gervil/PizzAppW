//
//  ConfirmacionController.swift
//  PizzAppW
//
//  Created by Gerardo Villarroel on 28/5/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionController: WKInterfaceController {

    var eleccionTap = [String]()
    @IBOutlet var resumenDelPedido: WKInterfaceLabel!
    @IBOutlet var btnConfirmar: WKInterfaceButton!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        eleccionTap = context as! Array
        print(eleccionTap)
        var pedido = ""
        var ingredientes = ""
        
        if (eleccionTap.count == 3) {
            pedido = "Tu pedido es: \nUna Pizza \(eleccionTap[0]), masa \(eleccionTap[1]), y \(eleccionTap[2])."
        } else {
            pedido = "Tu pedido es: \nUna Pizza \(eleccionTap[0]), masa \(eleccionTap[1]), \(eleccionTap[2]), con "
            let cantidadDeIngredientes = eleccionTap.count - 3
            
            for i in 3...eleccionTap.count - 1 {
                ingredientes += eleccionTap[i]
                if (i-2 < cantidadDeIngredientes) {
                    ingredientes += ", "
                }
            
                if (i-1 == cantidadDeIngredientes) {
                    ingredientes += "y "
                } else if (i-2 == cantidadDeIngredientes) {
                    ingredientes += "."
                }
            }
        }
        resumenDelPedido.setText(pedido + ingredientes)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func confirmarPedido() {
        resumenDelPedido.setText("Tu pedido será preparado de inmediato! 😀")
        btnConfirmar.setEnabled(false)
    }
}
