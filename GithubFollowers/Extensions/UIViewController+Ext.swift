//
//  UIViewController+Ext.swift
//  GithubFollowers
//
//  Created by Matthew Tripodi on 3/15/24.
//

import UIKit
import SafariServices

fileprivate var containerView: UIView!

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    
    func presentSafariVC(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
}


// MARK: Keyboard
//extension UIViewController {
//    
//    @objc func keyboardWillShow(sender: NSNotification) {
//        guard let userInfo = sender.userInfo,
//              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
//              let currentTextField = UIResponder.currentFirst() as? UITextField else { return }
//        
//        print("foo - userInfo: \(userInfo)")
//        print("foo - keyboardFrame: \(keyboardFrame)")
//        print("foo - currentTextField: \(currentTextField)")
//        
//        // check if the top of the keyboard is above the bottom of the currently focused textbox
//        let keyboardTopY = keyboardFrame.cgRectValue.origin.y
//        let convertedTextFieldFrame = view.convert(currentTextField.frame, from: currentTextField.superview)
//        let textFieldBottomY = convertedTextFieldFrame.origin.y + convertedTextFieldFrame.size.height
//        
//        // if textField bottom is below keyboard bottom - bump the frame up
//        if textFieldBottomY > keyboardTopY {
//            let textBoxY = convertedTextFieldFrame.origin.y
//            let newFrameY = (textBoxY - keyboardTopY / 2) * -1
//            view.frame.origin.y = newFrameY
//        }
//        
//        print("foo - currentTextFieldFrame: \(currentTextField.frame)")
//        print("foo - convertedTextFieldFrame: \(convertedTextFieldFrame)")
//    }
//    
//    @objc func keyboardWillHide(notification: NSNotification) {
//        view.frame.origin.y = 0
//    }
//}
