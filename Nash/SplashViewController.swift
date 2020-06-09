//
//  SplashViewController.swift
//  Nash
//
//  Created by ntust04 on 2020/5/12.
//  Copyright © 2020 ntust04. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var asyncWorker : AsyncRequestWorker = AsyncRequestWorker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        
        asyncWorker.reponseDelegate = self
        
        asyncWorker.getResponse(from: "https://google.com", tag: 0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SplashViewController : AsyncReponseDelegate {
    func receviedReponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToMainView", sender: self)
        }
        
        
    }
    
    func receivedErrorMessage(_ sender: AsyncRequestWorker, errorString: String, tag: Int) {
        
    }
    
    
}
