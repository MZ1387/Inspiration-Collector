//
//  ViewController.swift
//  InspirationCollector
//
//  Created by Mario Zamora on 12/6/16.
//  Copyright © 2016 tinySEED. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var inspirations : [Inspiration] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            inspirations = try context.fetch(Inspiration.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inspirations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let inspiration = inspirations[indexPath.row]
        cell.textLabel?.text = inspiration.title
        cell.imageView?.image = UIImage(data: inspiration.image as! Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let inspiration = inspirations[indexPath.row]
        performSegue(withIdentifier: "inspirationSegue", sender: inspiration)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! InspirationViewController
        nextVC.inspiration = sender as? Inspiration
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

