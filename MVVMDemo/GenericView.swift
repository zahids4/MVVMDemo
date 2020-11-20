//
//  GenericView.swift
//  MVVMDemo
//
//  Created by Saim Zahid on 2020-11-20.
//

import UIKit


protocol GenericViewDelegate: class {
    func buttonTapped(newName: String)
}

class GenericView: UIView {
    private var viewModel: GenericViewRendering
    weak var delegate: GenericViewDelegate?
    
    
    private let namesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        
        return label
    }()
    
    private let namesLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    private let addNameButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private let addNameButtonTwo: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    init(frame: CGRect, viewModel: GenericViewRendering) {
        self.viewModel = viewModel
        
        super.init(frame: frame)
        
        self.viewModel.delegate = self
        self.backgroundColor = .white
        
        /// Add subviews
        self.addSubview(namesCountLabel)
        self.addSubview(namesLabel)
        self.addSubview(addNameButton)
        self.addSubview(addNameButtonTwo)
        
        /// Frames
        namesCountLabel.frame = CGRect(x: 50, y: 50, width: 100, height: 24)
        namesLabel.frame = CGRect(x: 50, y: 80, width: 300, height: 24)
        addNameButton.frame = CGRect(x: 50, y: 120, width: 250, height: 24)
        addNameButtonTwo.frame = CGRect(x: 50, y: 190, width: 250, height: 24)
        
        /// Configure addNameButton
        addNameButton.addTarget(self, action: #selector(addName), for: .touchUpInside)
        addNameButton.setTitle(viewModel.getAddNameButtonTitleText(), for: .normal)
        addNameButton.backgroundColor = UIColor.red
        
        /// Configure addNameButtonTwo
        addNameButtonTwo.addTarget(self, action: #selector(addNameTwo), for: .touchUpInside)
        addNameButtonTwo.setTitle(viewModel.getAddNameButtonTWoTitleText(), for: .normal)
        addNameButtonTwo.backgroundColor = UIColor.blue
        
        /// Add Text to dynamic labels
        configureLabelsText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabelsText() {
        /// Config Labels
        namesCountLabel.text = viewModel.getNamesCountLabelText()
        namesLabel.text = viewModel.getNamesLabelText()
    }
    
    @objc
    private func addName() {
        /**
            View should be calling out to delegate rather than direct calling methods
            Delegate vs closure depends on case can't choose one
         */
        delegate?.buttonTapped(newName: "Clousure")
        viewModel.addNameTapped(newName: "Clousure") {
            configureLabelsText()
        }
    }
    
    @objc
    private func addNameTwo() {
        viewModel.addName(newName: "Delegate")
    }
}

extension GenericView: GenericViewModelDelegate {
    /// Will be called after addNameTwo
    func genericViewModelDidAddName() {
        configureLabelsText()
    }
}
