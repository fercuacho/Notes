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
/*
    override func prepare( for segue: UIStoryboardSegue, sender: (Any)?){
        
        newNote = Note(title: noteTitle.text!, content: noteContent.text!, date: Date())
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
        
    }*/
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editNoteSegue" {
            if let selectedNote = sender as? Note {
                noteToEdit = selectedNote
            }
        }
    }
    
    /*

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
             // Si noteToEdit contiene una nota, estamos editando
              if var noteToEdit = noteToEdit {
              // Actualiza la nota existente
              noteToEdit.title = noteTitle.text
              noteToEdit.content = noteContent.text
              // Puedes actualizar otros campos si es necesario
              } else {
              // Si noteToEdit es nulo, estamos creando una nueva nota
              newNote = Note(title: noteTitle.text!, content: noteContent.text!, date: Date())
              if let newNote = newNote {
              noteManager.createNote(note: newNote)
              noteManager.saveNotes()
              //tableViewNotes.reloadData()
              } else {
              // Manejar el caso en el que newNote sea nil, si es necesario.
              }
              }
              noteManager.saveNotes()
              return true
              }
              return false
     }*/
    
    
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
            
            if let title = noteTitle.text, let content = noteContent.text {
                        let newNote = Note(title: title, content: content, date: Date())
                        noteManager.createNote(note: newNote)
                        noteManager.saveNotes()
                        // tableViewNotes.reloadData() - Nota: Esto solo funcionará si tableViewNotes es una propiedad de AddNoteViewController
                    } else {
                        // Manejar el caso en el que los campos de texto sean nil, si es necesario.
                    }
                    
                    return true
        }
        return false
    }

          
    }
