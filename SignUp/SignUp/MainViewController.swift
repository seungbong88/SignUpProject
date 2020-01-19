//
//  ViewController.swift
//  SignUp
//
//  Created by seungbong on 2020/01/18.
//  Copyright © 2020 한승희. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        idTextField.text = ""
        pwTextField.text = ""
    }

    @IBAction func clickedSigninBtn(_ sender: Any) {
        
        var id = idTextField.text ?? ""
        var pw = pwTextField.text ?? ""
        
        if id.count > 0 && pw.count > 0 {
            if UserInformation.UserShared.id == id && UserInformation.UserShared.password == pw {
                
                SysUtils.makeToast(message: "코코월드에 들어오신 걸 환영합니다", durationTime: 3, delayTime: 0.2)

                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc: UIViewController = storyboard.instantiateViewController(identifier: "CocoWorldVC") as UIViewController
                self.present(vc, animated: true, completion: nil)
            } else {
                  SysUtils.makeLongToast(message: "정보가 없습니다.\n코코월드에 들어올 수 없습니다.", durationTime: 3, delayTime: 0.2)
            }
        }
    }
    
   
    
    @IBAction func tappedScreen(_ sender: Any) {
        // 키패드 등이 열려있으면 닫아준다.
        self.view.endEditing(true)
    }
}

