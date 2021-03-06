//
//  ViewController.swift
//  isport-sample-swift
//
//  Created by mcg-corp on 6/3/20.
//  Copyright © 2020 isport. All rights reserved.
//

import UIKit
import ISPORTSDK

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        
        let data = ISportData(
            matchId: "11886290",
            token: "abcxyz",
            type: ISportData.ViewType.DETAIL,
            env: ISportData.Environment.DEV,
            debug: true
        )


        ISPORTSDK.onUserLogin = {
            
        }
        
        ISPORTSDK.onUserPurchase = { (packageId) in
            print("====onUserPurchase: \(packageId)")
            
        }
        
        //Call when Purchase success
        ISPORTSDK.onUserPurchaseSuccess()
        
        //Call when Purchase failed
        ISPORTSDK.onUserPurchaseFailed()
        
        ISPORTSDK.onUserStartLiveDetail = { (channelId) in
            print("====onUserStartLiveDetail: \(channelId)")
        }

        ISPORTSDK.addISportView(container: view, frame: view.frame, data: data)
        
        
    }


}

