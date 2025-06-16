//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by vp.off on 05.06.2025.
//

import UIKit
import CoreData


class AddBirthdayViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        birthdatePicker.maximumDate = Date()
    }
    @IBAction func saveTapped(_sender: UIBarButtonItem) {
        print("Нажата кнопка сохранения")
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        print("Меня зовут \(firstName) \(lastName)")
        
        let birthdate = birthdatePicker.date
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastName
        newBirthday.birthdate = birthdate
        newBirthday.birthdayID = UUID().uuidString
        
        if let uniqueID = newBirthday.birthdayID {
            print("birthdayID: \(uniqueID)")
        }
        
        do {
            try context.save()
        }
        catch let error {
            print ("Не удалось сохранить из-за ошибки \(error).")
        }
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelTapped(_sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

