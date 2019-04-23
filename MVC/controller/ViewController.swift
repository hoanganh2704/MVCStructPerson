//
//  ViewController.swift
//  MVC
//
//  Created by hoanganh on 4/23/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var avartar1: UIImageView!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var sexTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    var imagee: Data?
    var indexPath: IndexPath?
    var student3 : Student?
    override func viewDidLoad() {
        super.viewDidLoad()
        if student3 != nil{
            nameTextField.text = student3?.name
            ageTextField.text = student3?.age
            sexTextField.text = student3?.sex
            avartar1.image = student3?.photo
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func BtnChonAnh(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Thông Báo", message: "Chọn Ảnh", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "📗 Photo Library", style: .default, handler: {(action: UIAlertAction) in self.present(imagePickerController, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("asdasdas")
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let tempImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imagee = tempImage.pngData()
            avartar1.image = tempImage
        }
    picker.dismiss(animated: true, completion: nil)
}

    @IBAction func saveClick(_ sender: Any) {
        if student3 != nil {
            
            DataService.conpho.edit(indexPath: indexPath!, photo1: avartar1.image!, name1: nameTextField.text!, age1: ageTextField.text!, sex1: sexTextField.text!)}else{
            DataService.conpho.add(photo1: avartar1.image!, name1: nameTextField.text!, age1: ageTextField.text!, sex1: sexTextField.text!)
            
        }
        
        navigationController?.popViewController(animated: true)
    }
}
