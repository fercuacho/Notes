//
//  Note.swift
//  Notes
//
//  Created by José Fernando Cristóbal Huerta on 22/09/23.
//

import Foundation

struct Note : Codable {
    var id: UUID // Agregar una propiedad de identificador único

    var title : String
    var content : String
    var date : Date
    
    
    init(id: UUID = UUID(), title: String, content: String, date: Date) {
           self.id = id
           self.title = title
           self.content = content
           self.date = date
       }
}
