//
//  IngredientesController.swift
//  PizzAppW
//
//  Created by Gerardo Villarroel on 28/5/16.
//  Copyright © 2016 Gerardo Villarroel. All rights reserved.
//

import WatchKit
import Foundation


class IngredientesController: WKInterfaceController {

    var eleccionTap = [String]()
    var ingredientes = [String]()
    let mensajeParaContinuar = "Solo puedes elejir hasta 5 ingredientes. Baja al final de la lista para continuar!"
    
    @IBOutlet var check2bleQueso: WKInterfaceImage!
    @IBOutlet var checkAceituna: WKInterfaceImage!
    @IBOutlet var checkAnchoa: WKInterfaceImage!
    @IBOutlet var checkCebolla: WKInterfaceImage!
    @IBOutlet var checkChampiñon: WKInterfaceImage!
    @IBOutlet var checkJamon: WKInterfaceImage!
    @IBOutlet var checkPavo: WKInterfaceImage!
    @IBOutlet var checkPepperoni: WKInterfaceImage!
    @IBOutlet var checkPimenton: WKInterfaceImage!
    @IBOutlet var checkPiña: WKInterfaceImage!
    @IBOutlet var checkSalchicha: WKInterfaceImage!
    @IBOutlet var checkTocino: WKInterfaceImage!
    
    var statusCheck2bleQueso = false
    var statusAceituna = false
    var statusAnchoa = false
    var statusCebolla = false
    var statusChampiñon = false
    var statusJamon = false
    var statusPavo = false
    var statusPepperoni = false
    var statusPimenton = false
    var statusPiña = false
    var statusSalchicha = false
    var statusTocino = false
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        eleccionTap = context as! Array
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

    @IBAction func elije2bleQueso() {
        if ingredientes.count == 5 && !statusCheck2bleQueso {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("2ble Queso")
    }
    
    @IBAction func elijeAceituna() {
        if ingredientes.count == 5 && !statusAceituna {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Aceituna")
    }
    
    @IBAction func elijeAnchoa() {
        if ingredientes.count == 5 && !statusAnchoa {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Anchoa")
    }
    
    @IBAction func elijeCebolla() {
        if ingredientes.count == 5 && !statusCebolla {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Cebolla")
    }
    
    @IBAction func elijeChampiñon() {
        if ingredientes.count == 5 && !statusChampiñon {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Champiñon")
    }
    
    @IBAction func elijeJamon() {
        if ingredientes.count == 5 && !statusJamon {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Jamon")
    }
    
    @IBAction func elijePavo() {
        if ingredientes.count == 5 && !statusPavo {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Pavo")
    }
    
    @IBAction func elijePepperoni() {
        if ingredientes.count == 5 && !statusPepperoni {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Pepperoni")
    }
    
    @IBAction func elijePimenton() {
        if ingredientes.count == 5 && !statusPimenton {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Pimenton")
    }
    
    @IBAction func elijePiña() {
        if ingredientes.count == 5 && !statusPiña {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Piña")
    }
    
    @IBAction func elijeSalchicha() {
        if ingredientes.count == 5 && !statusSalchicha {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Salchicha")
    }
    
    @IBAction func elijeTocino() {
        if ingredientes.count == 5 && !statusTocino {alertas(mensajeParaContinuar)}
        contadorDeIngredientes("Tocino")
    }
    
    @IBAction func siguientePaso() {
        if (ingredientes.count == 0) {
            alertas("Debes elejir al menos 1\ningrediente")
        } else {
            let eleccionUsuario = eleccionTap + ingredientes
            pushControllerWithName("ConfirmarPedido", context: eleccionUsuario)
        }
    }
    
    //Función para generar substrings.
    func substringNombreBoton(nombreBoton: String)-> String {
        let start = nombreBoton.startIndex.advancedBy(3)
        let end = nombreBoton.endIndex
        return nombreBoton[start..<end]
    }
    
    func alertas(mensaje: String) {
        let cancel = WKAlertAction(title: "👍", style: WKAlertActionStyle.Cancel, handler: {()-> Void in})
        //let action = WKAlertAction(title: "👎🏻", style: WKAlertActionStyle.Default, handler: {()-> Void in})
        
        self.presentAlertControllerWithTitle("👀", message: mensaje, preferredStyle: WKAlertControllerStyle.Alert, actions: [cancel])
    }
    
    func contadorDeIngredientes(nombreBoton: String) {
        var check: Bool = false
        if (!ingredientes.isEmpty) {
            for i in 1...ingredientes.count {
                if (ingredientes[i-1] == nombreBoton) {
                    ingredientes.removeAtIndex(i-1)
                    checkIngrediente(nombreBoton, check: true)
                    check = true
                    break
                }
            }
        }
        if (ingredientes.count < 5 && !check) {
            ingredientes.append(nombreBoton)
            checkIngrediente(nombreBoton, check: false)
            check = false
        }
    }
    
    func checkIngrediente(nombreBoton: String, check: Bool) {
        switch nombreBoton {
        case "2ble Queso":
            check2bleQueso.setHidden(check)
            self.statusCheck2bleQueso = !check
        case "Aceituna":
            checkAceituna.setHidden(check)
            self.statusAceituna = !check
        case "Anchoa":
            checkAnchoa.setHidden(check)
            self.statusAnchoa = !check
        case "Cebolla":
            checkCebolla.setHidden(check)
            self.statusCebolla = !check
        case "Champiñon":
            checkChampiñon.setHidden(check)
            self.statusChampiñon = !check
        case "Jamon":
            checkJamon.setHidden(check)
            self.statusJamon = !check
        case "Pavo":
            checkPavo.setHidden(check)
            self.statusPavo = !check
        case "Pepperoni":
            checkPepperoni.setHidden(check)
            self.statusPepperoni = !check
        case "Pimenton":
            checkPimenton.setHidden(check)
            self.statusPimenton = !check
        case "Piña":
            checkPiña.setHidden(check)
            self.statusPiña = !check
        case "Salchicha":
            checkSalchicha.setHidden(check)
            self.statusSalchicha = !check
        case "Tocino":
            checkTocino.setHidden(check)
            self.statusTocino = !check
        default: break
        }
    }
}
