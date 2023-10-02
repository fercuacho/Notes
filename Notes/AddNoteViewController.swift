//
//  AddNoteViewController.swift
//  Notes
//
//  Created by José Fernando Cristóbal Huerta on 23/09/23.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var noteContent: UILabel!
    var newNote : Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        
        
    }
    
    
    
    
    // MARK: - Navigation

    override func prepare( for segue: UIStoryboardSegue, sender: Any?){
        
        newNote = Note(title: noteTitle.text!, content: noteContent.text!, date: Date())
        let destination = segue.destination as! NotesTableViewController
        destination.note = newNote
        
    }
    
     override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    

}
