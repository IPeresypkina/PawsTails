//
//  EditProfileUserViewController.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/1/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit

class EditProfileUserViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var patronymic: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
    }
    
    
    @IBAction func uploadeImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        saveChanges()
    }
    
    func setupProfile() {
        avatar.clipsToBounds = true
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            avatar.image = selectedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveChanges() {
        
    }
    
}
