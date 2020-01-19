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

    @IBAction func clickedSigninBtn(_ sender: Any) {
        if(UserInformation.UserShared.id == idTextField.text
            && UserInformation.UserShared.password == pwTextField.text){
            makeToast(message: "코코월드에 들어오신 걸 환영합니다.")
        }else{
            makeToast(message: "정보가 일치하지 않습니다. 코코월드에 들어올 수 없습니다.")
        }
    }
    
    
    func makeToast(message: String) {
        print("\(message)")
    }
   
    
    @IBAction func tappedScreen(_ sender: Any) {
        // 키패드 등이 열려있으면 닫아준다.
        self.view.endEditing(true)
    }
}

