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
    
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        imagePicker.delegate = self
        
        
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
        
    
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let inspiration = Inspiration(context: context)
        inspiration.title = titleTextField.text
        inspiration.image = UIImagePNGRepresentation(InspirationImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
    
    
    
    
    
    
    

}
