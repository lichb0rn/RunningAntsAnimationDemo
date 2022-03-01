//
//  ViewController.swift
//  AntAnimations
//
//  Created by Miroslav Taleiko on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loadingText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        createAntsLoading()
    }

    func createAntsLoading() {
        let antsLoader = CAShapeLayer()
        
        let lineWidth: CGFloat = 6
        antsLoader.lineWidth = lineWidth
        antsLoader.strokeColor = UIColor.purple.cgColor
        
        antsLoader.path = UIBezierPath(ovalIn: CGRect(x: lineWidth / 2, y: lineWidth / 2, width: 200 - lineWidth, height: 200 - lineWidth)).cgPath
        antsLoader.frame = CGRect(x: view.frame.midX - 100, y: view.frame.midY - 100, width: 200, height: 200)
        
        let radius = (200 - lineWidth) / 2
        let cicumference = 2 * CGFloat(Double.pi) * radius
        let phaseSize = cicumference / 200
        antsLoader.lineDashPattern = [NSNumber(value: Float(phaseSize))]
        antsLoader.fillColor = nil
        
        view.layer.addSublayer(antsLoader)
        
        let rotationalAnimation = CABasicAnimation(keyPath: "transform")
        rotationalAnimation.byValue = CATransform3DMakeRotation(CGFloat(Double.pi), 0, 0, 1)
        rotationalAnimation.duration = 10
        rotationalAnimation.repeatCount = .greatestFiniteMagnitude
        rotationalAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        
        antsLoader.add(rotationalAnimation, forKey: nil)
        
        let fadeInAndOutAnimation = CABasicAnimation(keyPath: "opacity")
        fadeInAndOutAnimation.fromValue = 1
        fadeInAndOutAnimation.toValue = 0.0
        fadeInAndOutAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        fadeInAndOutAnimation.repeatCount = .greatestFiniteMagnitude
        fadeInAndOutAnimation.autoreverses = true
        fadeInAndOutAnimation.duration = 0.75
        
        loadingText.layer.add(fadeInAndOutAnimation, forKey: nil)
    }
}

