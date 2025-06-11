//
//  ViewController.swift
//  BirthdayTracker
//
//  Created by vp.off on 05.06.2025.
//

import UIKit

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
        let newBirthday = Birthday(firstName: firstName, lastName: lastName, birthdate: birthdate)
        
        print("Создана запись о дне рождения!")
        print("Имя: \(newBirthday.firstName)")
        print("Фамилия: \(newBirthday.lastName)")
        print("День рождения: \(newBirthday.birthdate)")
    }
    
    @IBAction func cancelTapped(_sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

