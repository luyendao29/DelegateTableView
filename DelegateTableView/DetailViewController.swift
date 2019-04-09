//
//  DetailViewController.swift
//  DelegateTableView
//
//  Created by Boss on 4/1/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

protocol detailDelegate {
    func updateData(avat: Data, name: String, gia: String)
}

class DetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var nameL: UITextField!
    @IBOutlet weak var priceL: UITextField!
    @IBOutlet weak var imageL: UIImageView!
    var delegate: detailDelegate?
    var perSon: Peron?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let perSon = perSon, let imageData = perSon.image {
          imageL.image  = UIImage(data:imageData)
            nameL.text = perSon.name
            priceL.text = perSon.price
            
        }
        // Do any additional setup after loading the x`view.
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    @IBAction func sua(_ sender: UIButton) {
        let image = imageL.image!.pngData()!
        delegate?.updateData(avat: image , name: nameL.text!, gia: priceL.text!)
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        imageL.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }

    
    
    /*im
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
