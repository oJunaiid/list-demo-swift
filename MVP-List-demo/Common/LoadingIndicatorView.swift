//
//  LoadingIndicatorView.swift
//  MVP-List-demo
//
//  Created by Omar  on 7/10/23.
//

import Foundation
import UIKit

class LoadingIndicatorView {
    
    private static var loadingIndicatorOverlay: UIView?
    
    // MARK: Loading Indicator
    
    class func show() {
        
        // If indicator is being shown, do nothing
        if let _ = loadingIndicatorOverlay {
            return
        }
        
        hide(shouldAnimate: false)
        
        let sceneDelegate = UIApplication.shared.connectedScenes
               .first!.delegate as! SceneDelegate
        let window = sceneDelegate.window!

        loadingIndicatorOverlay = UIView()
        loadingIndicatorOverlay!.frame = (window.bounds)
        loadingIndicatorOverlay!.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.center = loadingIndicatorOverlay!.center
        activityIndicator.startAnimating()
        
        loadingIndicatorOverlay?.addSubview(activityIndicator)
        loadingIndicatorOverlay?.alpha = 0
        
        // Adding it to window
        window.addSubview(loadingIndicatorOverlay!)
        
        UIView.animate(withDuration: 0.3) {
            loadingIndicatorOverlay?.alpha = 1
        }
    }
    
    class func hide(shouldAnimate: Bool = true) {
        
        // If loading indicator is not shown
        guard let progressView = loadingIndicatorOverlay else { return }
        
        if shouldAnimate {
            
            UIView.animate(withDuration: 0.5, animations: {
                progressView.alpha = 0
            }) { (isComplete) in
                
                if isComplete {
                    progressView.removeFromSuperview()
                    self.loadingIndicatorOverlay = nil
                }
            }
        } else {
            progressView.removeFromSuperview()
            self.loadingIndicatorOverlay = nil
        }
    }
}
