//
//  InspirationViewController.swift
//  InspirationCollector
//
//  Created by Mario Zamora on 12/6/16.
//  Copyright © 2016 tinySEED. All rights reserved.
//

import UIKit

class InspirationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    @IBOutlet weak var InspirationImageView: UIImageView!
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var addUpdateButton: UIButton!
    
    @IBOutlet weak var deleteButton: UIButton!
    
    
    var imagePicker = UIImagePickerController()
    var inspiration : Inspiration? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        imagePicker.delegate = self
        
        if inspiration != nil {
            InspirationImageView.image = UIImage(data: inspiration!.image as! Data)
            titleTextField.text = inspiration!.title
            addUpdateButton.setTitle("Update", for: .normal)
        } else {
            deleteButton.isHidden = true
        }
        
        
    }
    
    
    
    
    
    @IBAction func photosTapped(_ sender: Any) {
        
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        InspirationImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    

    
    @IBAction func addTapped(_ sender: Any) {
        
        if inspiration != nil {
            
            inspiration!.title = titleTextField.text
            inspiration!.image = UIImagePNGRepresentation(InspirationImageView.image!) as NSData?
            
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let inspiration = Inspiration(context: context)
            inspiration.title = titleTextField.text
            inspiration.image = UIImagePNGRepresentation(InspirationImageView.image!) as NSData?
            
        }
        
    
       
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    @IBAction func deleteTapped(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(inspiration!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
    
    
    
    
    

}
