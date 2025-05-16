//
//  OnboardingViewController.swift
//  WearMe
//
//  Created by Pritam  on 14/05/25.
//

import UIKit

protocol OnboardingNavigationDelegate: AnyObject{
    func goToNextPage( from controller : UIViewController)
}


class OnboardingViewController: UIPageViewController {
    
    private let pageControl = UIPageControl()
    private let viewModel = OnboardingViewModel()
    
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        
        if let firstVC = viewModel.viewControllers.first {
            (firstVC as? WelcomeViewController)?.navigationDelegate = self
            setViewControllers([firstVC], direction: .forward, animated: true)
        }
        
        viewModel.viewControllers.forEach {
            ($0 as? WelcomeViewController)?.navigationDelegate = self
            ($0 as? StartJourneryViewController)?.navigationDelegate = self
            ($0 as? BenifitHighlightViewController)?.navigationDelegate = self
        }
        
        setupPageControl()
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = viewModel.viewControllers.count
        pageControl.currentPage = currentPage
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -101),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
    }
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        let index = sender.currentPage
        guard index >= 0 && index < viewModel.viewControllers.count else { return }
        
        let targetVC = viewModel.viewControllers[index]
        setViewControllers([targetVC], direction: .forward, animated: true)
        currentPage = index
    }
}

// MARK: - UIPageViewControllerDataSource & Delegate
extension OnboardingViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return viewModel.viewController(before: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return viewModel.viewController(after: viewController)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if completed,
           let currentVC = viewControllers?.first,
           let index = viewModel.index(of: currentVC) {
            currentPage = index
            pageControl.currentPage = currentPage
        }
    }
}

// MARK: - OnboardingNavigationDelegate
extension OnboardingViewController: OnboardingNavigationDelegate {
    func goToNextPage(from controller: UIViewController) {
        guard let nextVC = viewModel.nextViewController(from: controller) else { return }
        setViewControllers([nextVC], direction: .forward, animated: true)
        if let newIndex = viewModel.index(of: nextVC) {
            currentPage = newIndex
            pageControl.currentPage = newIndex
        }
    }
}

