//
//  WelcomViewController.swift
//  WearMe
//
//  Created by Pritam  on 14/05/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    weak var navigationDelegate: OnboardingNavigationDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func nextButtonTapped (_ Sender : UIButton){
        navigationDelegate?.goToNextPage(from: self)
    }
}
