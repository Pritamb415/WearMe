//
//  GradientBackgroundView.swift
//  WearMe
//
//  Created by Pritam  on 29/04/25.
//

import UIKit

class GradientBackgroundView: UIView {

    private var gradientLayer : CAGradientLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGradient()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    private func setupGradient(){
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 72/255, green: 178/255, blue: 231/255, alpha: 1).cgColor,
                                UIColor(red: 0/255, green: 118/255, blue: 177/255, alpha: 1).cgColor
                                ]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        gradientLayer.frame = bounds
        
    }
    
}
