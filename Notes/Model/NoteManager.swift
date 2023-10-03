//
//  NoteManager.swift
//  Notes
//
//  Created by José Fernando Cristóbal Huerta on 22/09/23.
//

import Foundation

class NoteManager {
    private var notes : [Note] = []
    
    init () {
        loadNotes()
    }
    
    func createNote(note : Note){
        notes.append(note)
    }
    
    func deleteNote(at index : Int){
        notes.remove(at: index)
    }
    
    func countNotes() -> Int {
        return notes.count
    }
    
    func getNote(at index : Int) -> Note {
        return notes[index]
    }
    
    func getNotes() -> [Note]{
        return notes
    }
    
    func indexOfNote(withTitle title: String) -> Int? {
        return notes.firstIndex { $0.title == title }
    }
    
    func loadNotes(){
        //set directory for save json file
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let notesPath = documentDirectory.appendingPathComponent("notes.json")
        
        if fileManager.fileExists(atPath: notesPath.path){
            do{
                let jsonData = fileManager.contents(atPath: notesPath.path)
                //print("json:", jsonData)
                notes = try JSONDecoder().decode([Note].self, from: jsonData!)
            }
            catch let error{
                print ("error: ", error)
            }
        }else{
            print("MSG: Files does not ")
        }
        
    }
    
    func saveNotes(){
        
        //set directory for save json file
        let fileManager = FileManager.default
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let notesPath = documentDirectory.appendingPathComponent("notes.json")
        
        //add note to json file
        do{
            let jsonData = try JSONEncoder().encode(notes)
            print("path", notesPath.absoluteString)
            fileManager.createFile(atPath: notesPath.path, contents: jsonData)
        }catch let error{
            print(error)
        }
    }
    
    func updateNote(at index: Int, with updatedNote: Note) {
        notes[index] = updatedNote
        saveNotes()
    }
    
}
