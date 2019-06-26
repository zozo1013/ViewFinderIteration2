//
//  AddPhotoViewController.swift
//  ViewFinder
//
//  Created by Apple on 6/25/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var newScreen = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        newScreen.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func CameraButton(_ sender: UIButton) {
        newScreen.sourceType = .camera
        present(newScreen, animated: true, completion: nil)
    }
    
    
    
    @IBOutlet weak var TextField: UITextField!
    
    
    
    @IBAction func SaveButton(_ sender: UIButton) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            let photoToSave = Photos(entity: Photos.entity() , insertInto: context)
          
             photoToSave.caption = TextField.text
            
             if let userImage = PlaceHolderPhoto.image {
               
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                }
        }
       (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        
       navigationController?.popViewController(animated: true)
      
        }
    
    }

    

    
    
    @IBAction func AlbumsButton(_ sender: UIButton) {
        newScreen.sourceType = .photoLibrary
        present(newScreen, animated: true, completion: nil)
    }
    
    @IBOutlet weak var PlaceHolderPhoto: UIImageView!
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            PlaceHolderPhoto.image = selectedImage
    }
        newScreen.dismiss(animated: true, completion: nil)
    
    
    }
}
