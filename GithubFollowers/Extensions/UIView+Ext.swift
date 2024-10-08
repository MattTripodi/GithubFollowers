//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Matthew Tripodi on 10/1/24.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
