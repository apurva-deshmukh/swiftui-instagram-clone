//
//  Extensions.swift
//  InstagramClone
//
//  Created by Apurva Deshmukh on 1/21/23.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
