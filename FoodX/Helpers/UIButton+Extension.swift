//
//  UIButton+Extension.swift
//  FoodX
//
//  Created by Sravan Goud on 17/06/25.
//

import UIKit

extension UIButton {
    // Store the animator as a private property using a static dictionary
    private static var animators: [Int: UIViewPropertyAnimator] = [:]
    
    private var currentAnimator: UIViewPropertyAnimator? {
        get {
            Self.animators[hashValue]
        }
        set {
            Self.animators[hashValue] = newValue
        }
    }
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        // Stop any ongoing animation
         currentAnimator?.stopAnimation(true)
         
         // Trigger haptic feedback
        let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
         
         // Scale down animation
         let animator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5) {
             self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
         }
         animator.startAnimation()
         currentAnimator = animator
    }
    
    @objc private func animateUp(sender: UIButton) {
        // Stop any ongoing animation
        currentAnimator?.stopAnimation(true)
        
        // Bounce back animation
        let animator = UIViewPropertyAnimator(duration: 0.4, dampingRatio: 0.5, animations: {
            self.transform = .identity
        })
        animator.startAnimation()
        currentAnimator = animator
    }
    
}
