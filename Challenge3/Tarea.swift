//
//  Tarea.swift
//  Challenge3
//
//  Created by Esthefano Pastor on 2/12/22.
//

import Foundation

struct Tarea {
    let titulo: String
    let descripcion: String
    let prioridad: String
    
    init(titulo: String, descripcion: String, prioridad: String) {
        self.titulo = titulo
        self.descripcion = descripcion
        self.prioridad = prioridad
    }
}
