//
//  AnimalDetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by C4Q on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {

    
    @IBOutlet weak var animalImage: UIImageView!
    
    @IBOutlet weak var animalName: UILabel!
    
    
    @IBOutlet weak var animalInfo: UITextView!
    
    var animal: ZooAnimal?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let animal = animal else {
            return
        }
        animalImage.image = UIImage(named: String(animal.imageNumber))
        animalName.text = animal.name
        animalInfo.text = animal.info

        // Do any additional setup after loading the view.
    }


    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
