//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  
    @IBOutlet weak var animalTableView: UITableView!
    
    var animals: [[ZooAnimal]] = [[]]
    
    func loadData() {
        animals[0] = ZooAnimal.zooAnimals.filter{$0.classification == "Mammal"}
        animals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Reptile"})
        animals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Bird"})
        animals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Amphibian"})
        animals.append(ZooAnimal.zooAnimals.filter{$0.classification == "Insect"})
    }
    
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Mammal"
        case 1:
            return "Reptile"
        case 2:
            return "Bird"
        case 3:
            return "Amphibian"
        case 4:
            return "Insect"
        default:
            return nil 
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let animal = self.animals[indexPath.section][indexPath.row]
        guard let animalCell = animalTableView.dequeueReusableCell(withIdentifier: "Animal Cell", for: indexPath) as? AnimalTableViewCell else {
            return UITableViewCell()
        }
        animalCell.animalImage.image = UIImage(named: String(animal.imageNumber))
        animalCell.nameLabel.text = animal.name
        animalCell.classificationLabel.text = "\(animal.classification)" + "\n" + "Origin:" + "\(animal.origin)"
        
      
        return animalCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        animalTableView.delegate = self
        animalTableView.dataSource = self 
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? AnimalDetailViewController {
            let selectedSection = animalTableView.indexPathForSelectedRow!.section
            let selectedRow = animalTableView.indexPathForSelectedRow!.row
            
            let selectedAnimal = self.animals[selectedSection][selectedRow]
            destination.animal = selectedAnimal
        }
    }
    
    
    
    
    

}

