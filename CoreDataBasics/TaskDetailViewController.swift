//
//  TaskDetailViewController.swift
//  CoreDataBasics
//
//  Created by Christy Hicks on 12/3/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    // MARK: - Properties
    var task: Task? {
        didSet  {
            updateViews()
        }
    }
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
     private func updateViews() {
           guard isViewLoaded else { return }
           title = task?.name ?? "Create Task"
           nameTextField.text = task?.name
           notesTextView.text = task?.notes
       }
    
    // MARK: - Actions
    @IBAction func saveAction(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        
        let notes = notesTextView.text
        
        // Editing an existing task
        if let task = task {
            task.name = name
            task.notes = notes
        } else {
            // Creating a new task.
        let _ = Task(name: name, notes: notes)
        }
        do {
            let moc = CoreDataStack.shared.mainContext
            try moc.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
        
        navigationController?.popViewController(animated: true)
    }
}
