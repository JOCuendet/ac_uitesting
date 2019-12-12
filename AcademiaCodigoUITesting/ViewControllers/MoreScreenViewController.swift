//
//  SecondViewController.swift
//  AcademiaCodigoUITesting
//
//  Created by jonathan Cuendet on 10/12/2019.
//  Copyright © 2019 jonathan Cuendet. All rights reserved.
//
import Foundation
import UIKit

class MoreScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goToNextScreen(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "GalleryScreen") as! GalleryViewController
        self.navigationController?.pushViewController(controller, animated: true)
        print("clicked")
        
    }
    
}

