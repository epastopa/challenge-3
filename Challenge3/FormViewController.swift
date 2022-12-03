//
//  FormViewController.swift
//  Challenge3
//
//  Created by Esthefano Pastor on 2/12/22.
//

import UIKit

protocol FormViewControllerDelegate {
    func formViewController(_ formViewController: FormViewController, didCreateTask newTask: Tarea)
}

class FormViewController: UIViewController {

    @IBOutlet weak var tituloTextField: UITextField?
    @IBOutlet weak var prioridadTextField: UITextField?
    @IBOutlet weak var descripcionTextView: UITextView?
    
    var delegate: FormViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        let titulo = tituloTextField?.text
        let prioridad = prioridadTextField?.text
        let descripcion = descripcionTextView?.text
        
        guard let _titulo = titulo, !_titulo.isEmpty else { return }
        guard let _prioridad = prioridad, !_prioridad.isEmpty else { return }
        guard let _descripcion = descripcion, !_descripcion.isEmpty else { return }
        
        let nuevaTarea = Tarea(titulo: _titulo, descripcion: _descripcion, prioridad: _prioridad)
        
        delegate?.formViewController(self, didCreateTask: nuevaTarea)
        
        dismiss(animated: true)
    }
}
