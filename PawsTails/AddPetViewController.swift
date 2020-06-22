//
//  AddPetViewController.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/5/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit

class AddPetViewController: UIViewController {
    
    @IBOutlet weak var gender: UIPickerView!
    
    let data = ["Мальчик", "Девочка"]
    override func viewDidLoad() {
        super.viewDidLoad()
        gender.dataSource = self
        gender.delegate = self
    }
    
}

extension AddPetViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    
}

extension AddPetViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent: Int) -> String? {
        return data[row]
    }
}
