//
//  GenericViewModel.swift
//  MVVMDemo
//
//  Created by Saim Zahid on 2020-11-20.
//

import Foundation

typealias Name = String

protocol GenericViewRendering {
    var delegate: GenericViewModelDelegate? { get set }
    
    /// Getters
    func getNames() -> [Name]
    func getNamesCountLabelText() -> String
    func getNamesLabelText() -> String
    func getAddNameButtonTitleText() -> String
    func getAddNameButtonTWoTitleText() -> String
    
    /// BInding through completion block
    /// Naming was off should be sending events rather than directly mutating
    /// List of events that can happen (could have the data neede by VM e.g name)
    func addNameTapped(newName: String, completion: ()->())
    
    func addName(newName: String)
}

protocol GenericViewModelDelegate: class {
    func genericViewModelDidAddName()
}

class GenericViewModel: GenericViewRendering {
    private var names: [Name]
    weak var delegate: GenericViewModelDelegate?
    
    init(names: [Name]) {
        self.names = names
    }
    
    // GenericViewRendering
    func getNames() -> [Name] {
        return self.names
    }
    
    func getNamesCountLabelText() -> String {
        return "\(self.names.count) names"
    }
    
    func getNamesLabelText() -> String {
        return self.names.joined(separator: ", ")
    }
    
    func getAddNameButtonTitleText() -> String {
        return "Add name with closure"
    }
    
    func getAddNameButtonTWoTitleText() -> String {
        return "Add name with delegate"
    }
    
    func addNameTapped(newName: String, completion: ()->()) {
        self.names.append(newName)
        
        completion()
    }
    
    func addName(newName: String) {
        self.names.append(newName)
        
        delegate?.genericViewModelDidAddName()
    }
}
