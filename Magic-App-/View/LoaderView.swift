//
//  loaderView.swift
//  Magic_App
//
//  Created by hellen.heiny.f.santi on 26/05/23.
//

import UIKit

class LoaderView: UIView {

    var loadingView: UIVisualEffectView?

     override init(frame: CGRect) {
         let loadingScreen = UIBlurEffect(style: .dark)
         let loadingView = UIVisualEffectView(effect: loadingScreen)
         loadingView.frame = frame
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         self.loadingView = loadingView
         super.init(frame: frame)
         addSubview(loadingView)
         addLoading()
     }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }

     private func addLoading() {
         guard let loadingViewEffect = loadingView else { return }
         let activityIndicator = UIActivityIndicatorView(style: .large)
         activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
         loadingViewEffect.contentView.addSubview(activityIndicator)
         activityIndicator.center = loadingViewEffect.contentView.center
         activityIndicator.startAnimating()
     }
 }


extension UIView {
    func showLoading() {
        DispatchQueue.main.async {
            let loadingScreenView = LoaderView(frame: self.frame)
            self.addSubview(loadingScreenView)
        }
    }
    func removeLoading() {
        
        DispatchQueue.main.async {
            if let loadView = self.subviews.first(where: { $0 is LoaderView }) {
                loadView.removeFromSuperview()
            }
        }
     
    }
}
