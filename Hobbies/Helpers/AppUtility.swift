//
//  AppUtility.swift
//  Hobbies
//
//  Created by Amir Abbas Kashani on 5/18/19.
//  Copyright © 2019 companyA. All rights reserved.
//

import UIKit

class AppUtility: NSObject {
    public static func getAppVersion() -> String
    {
        let nsObject = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
        
        let version = nsObject as? String
        return version ?? ""
    }
    
    public static func getTopMostViewController() -> UIViewController?
    {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    public static func getCurrentViewController() -> UIViewController? {
        return UIApplication.topViewController()
    }
}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}

