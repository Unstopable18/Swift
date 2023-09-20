//
//  ViewController.swift
//  Magic8Ball
//
//  Created by CEMTREX on 20/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var magicImage: UIImageView!
    let magicAnswer:[UIImage]=Magic.allvalues
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonTapped(_ sender: Any) {
        magicImage.image=magicAnswer.randomElement() ?? UIImage(named: "ball1")
    }
    
}

