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
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistenContainer.viewContext{
            let photoToSave = Photos(entity: Photos.entity() , insertInto: context)
        photoToSave.caption = captionText.text
            if let userImage = newImageView.image {
                if let userImageData
            }
        }
    }

    
    
    
    
    
    @IBAction func AlbumsButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var PlaceHolderPhoto: UIImageView!
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            PlaceHolderPhoto.image = selectedImage
    }
        newScreen.dismiss(animated: true, completion: nil)
    
    
    }
}
