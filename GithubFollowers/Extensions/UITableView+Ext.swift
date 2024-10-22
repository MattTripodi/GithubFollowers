//
//  UITableView+Ext.swift
//  GithubFollowers
//
//  Created by Matthew Tripodi on 10/21/24.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
