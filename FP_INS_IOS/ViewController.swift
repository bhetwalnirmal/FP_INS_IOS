//
//  ViewController.swift
//  FP_INS_IOS
//
//  Created by nirmal on 2022-05-17.
//

import UIKit

class ViewController: UIViewController {
    var floatingActionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // initialize the floating action button
        self.floatingActionButton = UIButton(type: .custom)
        // setting up the target of the floating button
        self.floatingActionButton.addTarget(self, action: #selector(self.addDataFloatingActionButton(_:)), for: UIControl.Event.touchUpInside)
        // adding the floatingactionbutton as a subview in the view
        self.view.addSubview(self.floatingActionButton)
    }

    @objc func addDataFloatingActionButton (_ sender: UIButton) {
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        // setting the corner radius to make the button round
        floatingActionButton.layer.cornerRadius = 30
        // setting the color of the button to red
        floatingActionButton.backgroundColor = UIColor.red
        floatingActionButton.clipsToBounds = true
        
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 30.0, weight: .regular, scale: .medium)
        // using system image for the plus icon
        let symbol = UIImage(systemName: "plus", withConfiguration: symbolConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        // setting the symbol as the image of the floating action button
        floatingActionButton.setImage(symbol, for: .normal)
        floatingActionButton.translatesAutoresizingMaskIntoConstraints = false
        // adding constraints to place the floating action button to the bottom of the screen
        NSLayoutConstraint.activate([
            floatingActionButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
            floatingActionButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            floatingActionButton.widthAnchor.constraint(equalToConstant: 60),
            floatingActionButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}

