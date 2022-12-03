//
//  ListaTableViewController.swift
//  Challenge3
//
//  Created by Esthefano Pastor on 2/12/22.
//

import UIKit

class ListaTableViewController: UITableViewController {
    
    var tareas: [Tarea] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension ListaTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tarea = tareas[indexPath.row]
        let cell = UITableViewCell()
        
        var content = UIListContentConfiguration.subtitleCell()
        content.text = tarea.titulo
        content.secondaryText = tarea.descripcion
        
        cell.contentConfiguration = content
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detalleSegue", sender: self)
    }
    
}

extension ListaTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        
        if (segue.identifier == "detalleSegue") {
            let destination = nav?.viewControllers.first as? DetalleViewController
            
            guard let selectedRow = tableView.indexPathForSelectedRow?.row else { return }
            let tareaSeleccionada = tareas[selectedRow]
            
            destination?.titulo = tareaSeleccionada.titulo
            destination?.prioridad = tareaSeleccionada.prioridad
            destination?.descripcion = tareaSeleccionada.descripcion
            destination?.delegate = self
        } else {
            let destination = nav?.viewControllers.first as? FormViewController
            
            destination?.delegate = self
        }
    }
    
}

extension ListaTableViewController: FormViewControllerDelegate {
    
    func formViewController(_ formViewController: FormViewController, didCreateTask newTask: Tarea) {
        tareas.append(newTask)
        tableView.reloadData()
    }
    
}

extension ListaTableViewController: DetalleViewControllerDelegate {
    func detalleViewController(_ viewController: DetalleViewController, didDeleteTask tareaName: String) {
        tareas = tareas.filter{ $0.titulo != tareaName }
        tableView.reloadData()
    }
}
