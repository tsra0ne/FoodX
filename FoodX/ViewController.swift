//
//  ViewController.swift
//  FoodX
//
//  Created by Sravan Goud on 17/06/25.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        label.font = AppFont.extrabold.size(24)
        label.text = "All your favorites"
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

}
