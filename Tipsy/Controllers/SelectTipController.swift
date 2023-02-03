/* ViewController.swift --> Tipsy. Created by Miguel Torres on 25/01/23. */

import UIKit

class SelectTipController: UIViewController {

    // Conexiones IBOutlet con la interfaz.
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // Variables globales
    var tipValue = 0.0
    var people = 0.0
    var billTotal = 0.0
    var totalPP = 0.0
    
    // Función que controla la propina seleccionada.
    @IBAction func tipChanged(_ sender: UIButton) {
        // Cerramos el teclado del teléfono
        billTextField.endEditing(true)
        // Estructura selectiva para los botones que se presionan
        switch(sender.currentTitle!) {
        case "0%":
            // Modificamos el fondo de los botones al presionarse
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
            // Actualizamos el valor del botón
            tipValue = 0.0
        case "10%":
            zeroButton.isSelected = false
            tenButton.isSelected = true
            twentyButton.isSelected = false
            tipValue = 0.10
        case "20%":
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = true
            tipValue = 0.20
        default:
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = false
        }
        
    }
    
    // Función que controla el Stepper
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        people = sender.value
        splitNumberLabel.text = String(format: "%.0f", people)
    }
   
    // Función que activa el Segue
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTotal = Double(billTextField.text!)!
        totalPP =  (billTotal * (1.0 + tipValue)) / people
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    // Función para preparar los datos que vamos a mandar al ViewController de resultados
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "goToResults") {
            // segue.destination es el ViewController que se inicializa cuando se ejecuta el segue
            let referenceSegue = segue.destination as! ResultsViewController
            referenceSegue.totalPP = totalPP
            referenceSegue.people = people
            referenceSegue.tip = tipValue
        }
    }
    
}

/* Notas:
    Es posible que no aparezca el teclado del dispositivo simulado cuando presionamos sobre un TextField, para arreglar eso debemos ir a la pestaña de opciones I/O del simulador activo, y quitar la selección de "Connect hardware keyboard" en: I/O - Keyboard - Connect Hardware Keyboard.
    También podemos seleccionar el tipo de teclado que queremos que se muestre en el text field, dentro de las opciones de la ventana de inspector.
 */
