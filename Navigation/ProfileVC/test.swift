//
//  ViewController.swift
//  Animations
//
//  Created by Саидов Тимур on 05.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var redView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var animationButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapAnimationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    private lazy var someButton: UIButton = {
//        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 50))
//        button.layer.cornerRadius = 12
//        button.clipsToBounds = true
//        button.backgroundColor = .systemPurple
//        button.addTarget(self, action: #selector(self.didTapSomeButton), for: .touchUpInside)
//        return button
//    }()
//    private var animator: UIViewPropertyAnimator?
    
    private var redViewWidthConstaint: NSLayoutConstraint?
    private var redViewHeightConstaint: NSLayoutConstraint?
    
    private var isImageViewIncreased = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.setupView()
    }

    private func setupView() {
        self.view.addSubview(self.redView)
        self.view.addSubview(self.animationButton)
//        self.view.addSubview(self.someButton)
        
        self.redViewWidthConstaint = self.redView.widthAnchor.constraint(equalToConstant: 100)
        self.redViewHeightConstaint = self.redView.heightAnchor.constraint(equalToConstant: 100)
        
        NSLayoutConstraint.activate([
            self.redView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.redView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.redViewWidthConstaint,
            self.redViewHeightConstaint,
            
            self.animationButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.animationButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            self.animationButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            self.animationButton.heightAnchor.constraint(equalToConstant: 50)
        ].compactMap({ $0 }))
    }
    
    @objc private func didTapAnimationButton() {
        self.animationButton.isEnabled = false
        
        let completion: () -> Void = { [weak self] in
            self?.animationButton.isEnabled = true
        }
        
//        self.basicAnimation(completion: completion)
//        self.animateKeyframes(completion: completion)
//        self.animatePropertyAnimator(completion: completion)
//        self.animateLayer(completion: completion)
        self.layoutRedView(completion: completion)
    }
    
//    @objc private func didTapSomeButton() {
//        if let animator = self.animator {
//            animator.pauseAnimation()
//        }
//    }
    
    private func basicAnimation(completion: @escaping () -> Void) {
        let startPoint = self.redView.center
        
        UIView.animate(withDuration: 1.0,
                       delay: 0.0,
                       options: .curveEaseInOut) { // a(t) = At^2 - Bt + C
            // Фрейм меняется? Если да, то как?
            self.redView.center = CGPoint(x: startPoint.x, y: startPoint.y + 200)
//            self.redView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            self.redView.alpha = 0
        } completion: { _ in
            self.redView.center = startPoint
//            self.redView.transform = .identity
//            self.redView.isHidden = true
            completion()
        }
        
//        UIView.animate(withDuration: 0.25, delay: 0.0) {
//            self.redView.center = CGPoint(x: startPoint.x, y: startPoint.y + 200)
//        } completion: { _ in
//            UIView.animate(withDuration: 0.25, delay: 0.0) {
//                self.redView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            } completion: { _ in
//                UIView.animate(withDuration: 0.25, delay: 0.0) {
//                    self.redView.center = startPoint
//                } completion: { _ in
//                    UIView.animate(withDuration: 0.25, delay: 0.0) {
//                        self.redView.alpha = 0
//                    } completion: { _ in
//                        self.redView.isHidden = true
//                        completion()
//                    }
//                }
//            }
//        }
    }
    
    private func animateKeyframes(completion: @escaping () -> Void) {
        let startPoint = self.redView.center
        
        UIView.animateKeyframes(withDuration: 5.0,
                                delay: 0.0,
                                options: .calculationModeCubic) {
            // Сколько времени в процентах от всего времени анимации занимает данный конкретный кадр.
            UIView.addKeyframe(withRelativeStartTime: 0, // 0.0 sec
                               relativeDuration: 0.25) { // 1.25 sec.
                self.redView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.redView.alpha = 0.5
            }
            UIView.addKeyframe(withRelativeStartTime: 0, // 0.0 sec
                               relativeDuration: 0.5) { // 2.50 sec.
                self.redView.backgroundColor = .purple
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, // 1.25 sec.
                               relativeDuration: 0.25) { // 2.50 sec.
                self.redView.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.maxY)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.50,
                               relativeDuration: 0.25) {
                self.redView.center = CGPoint(x: self.view.bounds.width,
                                              y: startPoint.y)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75,
                               relativeDuration: 0.25) {
                self.redView.center = startPoint
                self.redView.transform = .identity
            }
        } completion: { _ in
            completion()
        }
    }
    
    private func animatePropertyAnimator(completion: @escaping () -> Void) {
        let startPoint = self.redView.center
        
        let animator = UIViewPropertyAnimator(duration: 5.0, curve: .linear) {
            self.redView.center = CGPoint(x: startPoint.x, y: startPoint.y + 200)
        }
        
        animator.startAnimation(afterDelay: 0.0)
    }
    
    private func animateLayer(completion: @escaping () -> Void) {
        let startPoint = self.redView.center
        
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.fromValue = startPoint
        animation.toValue = CGPoint(x: startPoint.x, y: startPoint.y + 200)
        animation.duration = 2.0
        animation.autoreverses = true
        animation.repeatCount = 5
        animation.isRemovedOnCompletion = true
        self.redView.layer.add(animation, forKey: #keyPath(CALayer.position))
    }
    
    private func layoutRedView(completion: @escaping () -> Void) {
        // setNeedsLayout.
        self.redViewWidthConstaint?.constant = self.isImageViewIncreased ? 100 : self.view.bounds.width
        self.redViewHeightConstaint?.constant = self.isImageViewIncreased ? 100 : self.view.bounds.width
        
        UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveEaseInOut) {
            print("🍏 RedView is animated")
            self.view.layoutIfNeeded()
        } completion: { _ in
            print("🍏 completion")
            self.isImageViewIncreased.toggle()
            completion()
        }
        
//        self.isImageViewIncreased.toggle()
//        completion()
    }
}
