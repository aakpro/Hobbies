
//
//  LoadingUtility.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import PKHUD

public class LoadingUtility: NSObject
{
    public static func showLoading()
    {
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        PKHUD.sharedHUD.show()
    }
    
    public static func hideLoading()
    {
        PKHUD.sharedHUD.hide(true)
    }
}
