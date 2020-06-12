//
//  ViewController.swift
//  Nash
//
//  Created by ntust04 on 2020/5/5.
//  Copyright © 2020 ntust04. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AF.request("https://nashservice.azurewebsites.net/api/BackgroundAudioApi").responseString(completionHandler: {
        response
        in
        
        switch( response.result ){
            
        case let .success(value) :
        
            print(value)
            //print(response.response!.statusCode)
            
            if let dataFromString = value.data(using: .utf8, allowLossyConversion: false) {
                let json = try! JSON(data: dataFromString)
                
                //print(json)
                
                for (index,subJson):(String, JSON) in json {
                    // Do something you want
                    
                    //ownerId
                    //name
                    //localPath
                    //uploadPath
                    //allowToUpload
                    
                    
                    let ownerId : Int = subJson["ownerId"].intValue
                    let name : String = subJson["name"].stringValue
                    let allowToUpload : Bool = subJson["allowToUpload"].boolValue

                    print("\( name ): \( allowToUpload )")
                    
                }
                
                
            }
            
            
            // 注意 guard 的使用方法。
            guard 200 == response.response!.statusCode else {
                
                
                
                return
            }
            
            
            break;
        case let .failure(error) :
            
            print(error.localizedDescription)
            break;
        }
        
        }) 
        
        
//        AF.request("https://nashservice.azurewebsites.net/api/BackgroundAudioApi").responseString(completionHandler: {
//               response
//               in
//
//               switch( response.result ){
//               case let .success(value) :
//
//                   //print(value)
//                   //print(response.response!.statusCode)
//
//                   if let dataFromString = value.data(using: .utf8, allowLossyConversion: false) {
//                       let json = try! JSON(data: dataFromString)
//
//                       //print(json)
//
//                       for (index,subJson):(String, JSON) in json {
//                           // Do something you want
//
//
//
//
//                           let name : String = subJson["name"].stringValue
//                           let metabolicate : Double = subJson["metabolicRate"].doubleValue
//
//                           print("\( name ): \( metabolicRate )")
//
//                       }
//
//
//                   }
//    }


//}

