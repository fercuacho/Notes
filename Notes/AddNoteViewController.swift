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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
             }
             return true
    }
    

}
