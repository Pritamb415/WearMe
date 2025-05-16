//
//  StartJourneryViewController.swift
//  WearMe
//
//  Created by Pritam  on 02/05/25.
//

import UIKit

class StartJourneryViewController: UIViewController {
    
    weak var navigationDelegate: OnboardingNavigationDelegate?


    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.nextButton.layer.cornerRadius = 10
    }
    
    @IBAction func nextButtonTapped (_ Sender : UIButton){
        navigationDelegate?.goToNextPage(from: self)
    }
    

}
