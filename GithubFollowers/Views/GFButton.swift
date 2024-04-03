//
//  GFButton.swift
//  GithubFollowers
//
//  Created by Matthew Tripodi on 3/7/24.
//

import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    // This is what handles initialization via Storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Initializer to pass in whatever background color and title needed
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        // Conforming to dynamic type so that the text adjusts as needed as per the device settings
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // This is basically to use Auto Layout
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
