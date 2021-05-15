//
//  Bindable.swift
//  BindableDemo
//
//  Created by Tashreque Mohammed Haq on 15/5/21.
//

import Foundation

/// The bindable class which accepts a value of arbitrary type and helps bind this value to the UI whenever set.
class Bindable<T> {
    
    /// The closure which is called when the value is set. The closure parameter is the arbitrary value.
    private var didSetValue = {(value: T?) in }
    
    /// The value to be set.
    var value: T? {
        didSet {
            didSetValue(value)
        }
    }
    
    /**
     The initializer for the bindable class which accepts an arbitrary value.
     
     - parameter value: The arbitrary value to accept.
     */
    init(_ value: T) {
        self.value = value
        didSetValue(self.value)
    }
    
    /**
     This function is called to bind the value with the class from which it is being invoked.
     
     - parameter completion: The closure is called to let the function caller retrieve the arbitrary value as its parameter.
     */
    func bind(completion: @escaping (T?) -> ()) {
        didSetValue = completion
        didSetValue(self.value)
    }
}
