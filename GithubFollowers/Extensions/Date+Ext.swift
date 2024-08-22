//
//  Date+Ext.swift
//  GithubFollowers
//
//  Created by Matthew Tripodi on 8/22/24.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        return dateFormatter.string(from: self)
    }
}
