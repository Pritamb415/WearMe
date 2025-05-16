//
//  OnboardingViewModel.swift
//  WearMe
//
//  Created by Pritam  on 15/05/25.
//

import UIKit

class OnboardingViewModel {

    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    private(set) var viewControllers: [UIViewController] = []
    private(set) var currentIndex: Int = 0

    init() {
        let firstVC = storyboard.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        let secondVC = storyboard.instantiateViewController(withIdentifier: "StartJourneryViewController") as! StartJourneryViewController
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "BenifitHighlightViewController") as! BenifitHighlightViewController
        
        viewControllers = [firstVC, secondVC, thirdVC]
    }
    
    func viewController(before viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        return viewControllers[index - 1]
    }
    
    func viewController(after viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else { return nil }
        return viewControllers[index + 1]
    }
    
    func index(of viewController: UIViewController) -> Int? {
        return viewControllers.firstIndex(of: viewController)
    }
    
    func nextViewController(from currentVC: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: currentVC),
              currentIndex + 1 < viewControllers.count else { return nil }
        return viewControllers[currentIndex + 1]
    }
}
