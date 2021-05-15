//
//  ViewController.swift
//  BindableDemo
//
//  Created by Tashreque Mohammed Haq on 15/5/21.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: ViewModelDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = ViewModel()
        bindViewModel()
        
        addButton()
    }
    
    func addButton() {
        let button = UIButton()
        button.setTitle("Fetch Updated Data", for: .normal)
        button.setTitleColor(.black, for: .normal)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor), button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)])
        
        button.addTarget(self, action: #selector(handleSelection), for: .touchUpInside)
    }
    
    func bindViewModel() {
        viewModel.characterList.bind { (list) in
            print("Obtained List = \(list ?? [])")
        }
    }
    
    @objc func handleSelection() {
        viewModel.getUpdatedMockData()
    }

}

