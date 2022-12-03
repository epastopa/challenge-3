//
//  DetalleViewController.swift
//  Challenge3
//
//  Created by Esthefano Pastor on 2/12/22.
//

import UIKit

protocol DetalleViewControllerDelegate {
    func detalleViewController(_ viewController: DetalleViewController, didDeleteTask tareaName: String)
}

class DetalleViewController: UIViewController {
    
    @IBOutlet weak var tituloLabel: UILabel?
    @IBOutlet weak var prioridadLabel: UILabel?
    @IBOutlet weak var descripcionTextView: UITextView?
    
    var delegate: DetalleViewControllerDelegate?
    
    var titulo: String?
    var prioridad: String?
    var descripcion: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tituloLabel?.text = titulo
        prioridadLabel?.text = prioridad
        descripcionTextView?.text = descripcion
    }
    
    @IBAction func deleteTapped(_ sender: UIBarButtonItem) {
        guard let _titulo = titulo, !_titulo.isEmpty else { return }
        
        delegate?.detalleViewController(self, didDeleteTask: _titulo)
        
        dismiss(animated: true)
    }
    
}
