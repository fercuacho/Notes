//
//  AddNoteViewController.swift
//  Notes
//
//  Created by José Fernando Cristóbal Huerta on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var noteTitle: UITextView!
    
    @IBOutlet weak var noteContent: UITextView!
    
    var newNote : Note?
    var noteToEdit: Note?  // Propiedad para almacenar la nota que se va a editar
    var noteManager: NoteManager! //

    override func viewDidLoad() {
        super.viewDidLoad()

        if let noteToEdit = noteToEdit {
                noteTitle.text = noteToEdit.title
                noteContent.text = noteToEdit.content
            }
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        print("Unwind segue!")
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // MARK: - Navigation

    override func prepare( for segue: UIStoryboardSegue, sender: (Any)?){
        
        newNote = Note(title: noteTitle.text!, content: noteContent.text!, date: Date())
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
        
    }
    
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "unwindSegue" {
            // Validar los campos aquí
            if noteTitle.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
                noteContent.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                // Muestra una alerta al usuario informando que los campos son obligatorios
                let alertController = UIAlertController(title: "Campos obligatorios", message: "Tanto el título como el contenido son obligatorios.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                present(alertController, animated: true, completion: nil)
                return false
            }
            /*// Si noteToEdit no es nulo, estamos editando una nota existente
             if var noteToEdit = noteToEdit,
             let noteIndex = noteManager.indexOfNote(withTitle: noteToEdit.title) {
             // Actualiza la nota existente
             noteToEdit.title = noteTitle.text
             noteToEdit.content = noteContent.text
             noteToEdit.date = Date() // Puedes actualizar la fecha si lo deseas
             noteManager.updateNote(at: noteIndex, with: noteToEdit)
             } else {
             // Si noteToEdit es nulo, estamos creando una nueva nota
             newNote = Note(title: noteTitle.text!, content: noteContent.text!, date: Date())
             noteManager.createNote(note: newNote!)
             }
             noteManager.saveNotes()
             return true
             }
             return false*/
            
            
        }
        return true
        
    }
}
