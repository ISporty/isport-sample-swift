//
//  ViewController.swift
//  isport-sample-swift
//
//  Created by mcg-corp on 6/3/20.
//  Copyright © 2020 isport. All rights reserved.
//

import UIKit
import ISPORTSDK

class ViewController: UIViewController, ISportDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let containerView = UIView(frame: CGRect(x: 20.0, y: 10, width: 350, height: 600))
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = UIColor.blue
        view.addSubview(containerView);
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
        
        let data = ISportData(
            matchId: "",
            token: "eyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiI5IiwiZXhwIjoxNjk2OTkwNzQ0LCJ1c2VySWQiOiI5IiwiZnVsbE5hbWUiOiJTaW5oIiwiYXZhdGFyVXJsIjoiIn0.UPYF9J66p3FpnEI-XBW9LBYW52YCAtf1SFozrA_b5p9_q4YXfIjTGRvf-uOFEKdYvmeFZJ56hV1zbokgX41qDy0nnFHrWiW_E8IpLX_2P7LKStKO4-aOFOH8C3NDopBqJFONJo39V74M0OjtRShGkLiov14cmwIPkIaxRUkHGJQ",
            type: ISportData.ViewType.HOME, env: ISportData.Environment.DEV,
            paramDeepLink: "screen=profile&type=month"
        )
        
        ISportManager.shared().addISportView(container: containerView, data: data, isportDelegate: self)
    }
    
    //Mark: ISportDelegate start
    func onStartLiveDetail(channelId: String) {
        self.showToastFaded(message: "onStartLiveDetail \(channelId)")
    }
    
    func onExchangeLoyalty(packageId: String, point: UInt32) {
        self.showToastFaded(message: "onExchangeLoyalty \(packageId) \(point)")
        
        let isSuccess = true
        
        if(isSuccess) {
            ISportManager.shared().onUserExchangeLoyaltySuccess()
        } else {
//            ISportManager.shared().onUserExchangeLoyaltyFailed()
        }
    }
    
    func onPurchase(packageId: String) {
        self.showToastFaded(message: "onExchangeLoyalty \(packageId)")
        
        let isSuccess = true
        
        if(isSuccess) {
            ISportManager.shared().onUserPurchaseSuccess()
        } else {
//            ISportManager.shared().onUserPurchaseFailed()
        }
    }
    
    func onLogin() {
        self.showToastFaded(message: "onLogin")
    }
    
    func onDismiss() {
        self.showToastFaded(message: "onDismiss")
    }
    
    func onError() {
        self.showToastFaded(message: "onError")
    }
    
    func onTimeout() {
        self.showToastFaded(message: "onTimeout")
    }
    //Mark: ISportDelegate end
    
    func showToastFaded(message : String) {


        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-100, width: 250, height: 35))
        toastLabel.numberOfLines = 0
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        toastLabel.sizeToFit()
        toastLabel.frame = CGRect( x: toastLabel.frame.minX, y: toastLabel.frame.minY,width:   toastLabel.frame.width + 20, height: toastLabel.frame.height + 8)

        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }


}
