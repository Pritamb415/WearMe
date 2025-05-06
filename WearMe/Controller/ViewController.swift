//
//  ViewController.swift
//  WearMe
//
//  Created by Pritam  on 28/04/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgoundView: GradientBackgroundView!
    
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    var gradientLayer: CAGradientLayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.getStartedButton.layer.cornerRadius = 10
    }

}

