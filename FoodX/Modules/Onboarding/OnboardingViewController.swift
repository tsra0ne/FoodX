//
//  OnboardingViewController.swift
//  FoodX
//
//  Created by Sravan Goud on 17/06/25.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = AppFont.bold.size(14)
        button.setTitleColor(.white, for: .normal)
        button.layer.backgroundColor = UIColor.customOrange.cgColor
        button.layer.cornerRadius = 12
        button.startAnimatingPressActions()
        return button
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.titleLabel?.font = AppFont.regular.size(16)
        button.setTitleColor(.customGray, for: .normal)
        button.startAnimatingPressActions()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .white
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        skipButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-40)
        }
        
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(skipButton.snp.top).offset(-16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.height.equalTo(62)
        }
    }

}
