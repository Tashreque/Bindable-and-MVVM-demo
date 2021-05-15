//
//  ViewModel.swift
//  BindableDemo
//
//  Created by Tashreque Mohammed Haq on 15/5/21.
//

import Foundation

protocol ViewModelDelegate {
    var characterList: Bindable<[String]> { get set }
    func getUpdatedMockData()
}

struct ViewModel: ViewModelDelegate {
    
    var characterList: Bindable<[String]> = Bindable([])
    
    init() {
        initializeViewModelWithMockData()
    }
    
    func initializeViewModelWithMockData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            characterList.value = ["A", "b", "C", "d"]
        }
    }
    
    func getUpdatedMockData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            characterList.value = ["X", "Y", "Z", "U"]
        }
    }
}
