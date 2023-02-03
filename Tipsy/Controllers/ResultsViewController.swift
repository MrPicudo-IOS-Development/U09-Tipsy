/* ResultsViewController.swift --> Tipsy. Created by Miguel Torres on 03/02/23. */

import UIKit

class ResultsViewController: UIViewController {
    
    // IBOutlets de la interfaz
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // Variables para recibir resultados.
    var totalPP = 0.0
    var people = 0.0
    var tip = 0.0
    
    // Cargamos los resultados obtenidos en los objetos de la interfaz
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalPP)
        settingsLabel.text = "Split between \(Int(people)) people with \(Int(tip * 100))% tip."
    }
    
    // Regresamos a la vista sender.
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}
