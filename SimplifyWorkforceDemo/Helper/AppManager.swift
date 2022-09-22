//
//  AppManger.swift
//  SimplifyWorkforceDemo
//
//  Created by Abhay Pratap Singh on 23/09/22.
//

import UIKit

class AppManager: NSObject {
    static let shared = AppManager()
    
    private override init() {
        
    }
    
    //MARK: Convert timeStamp into Time ago string
    func convertTimeIntoTimeAgo(_ timeStamp:Int)-> String {
        let exactDate = Date.init(timeIntervalSince1970: TimeInterval(timeStamp))
        return exactDate.timeAgoDisplay()
    }
    
    
    //MARK: Show Alert controller
    func showAlertMessage(_ title:String,_ message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constant.ok, style: UIAlertAction.Style.default, handler: nil))
        let window = UIApplication
            .shared
            .connectedScenes
            .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
            .first { $0.isKeyWindow }?.rootViewController
        window?.present(alert, animated: true, completion: nil)
    }
    
   
}
