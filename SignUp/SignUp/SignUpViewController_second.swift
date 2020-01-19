//
//  SignUpViewController_second.swift
//  SignUp
//
//  Created by seungbong on 2020/01/18.
//  Copyright © 2020 한승희. All rights reserved.
//

import UIKit

class SignUpViewController_second: UIViewController {

    var dateFormatter: DateFormatter = {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        return formatter
    }()
    
    @IBOutlet weak var userPhoneNumber: UITextField!
    @IBOutlet weak var userBirthDay: UILabel!
    @IBOutlet weak var datePickerView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var completeBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func clickedCancelBtn(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickedBackwardBtn(_ sender: Any) {
        userPhoneNumber.text = ""
        userBirthDay.text = ""
        datePickerView.isHidden = true
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickedCompleteBtn(_ sender: Any) {
        UserInformation.UserShared.birthDay = self.userBirthDay.text ?? ""
        UserInformation.UserShared.phoneNumber = self.userPhoneNumber.text ?? ""
        
        SysUtils.makeToast(message: "회원가입이 완료되었습니다.", durationTime: 2, delayTime: 1)

        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    

    
    // MARK: DatePicker method
    @IBAction func showDatePicker(_ sender: Any) {
        datePickerView.isHidden = false
    }
    
    
    @IBAction func clickedDatePickerOk(_ sender: Any) {
           let dateStr: String = dateFormatter.string(from: datePicker.date)
           userBirthDay.text = dateStr
           
           datePickerView.isHidden = true
    }
    
    @IBAction func clickedDatePickerCancel(_ sender: Any) {
        datePickerView.isHidden = true
    }

    @IBAction func tappedScreen(_ sender: Any) {
        if let phoneNum = userPhoneNumber.text {
            if phoneNum.count > 0 {
                completeBtn.setTitleColor(self.view.tintColor, for: .normal)
                completeBtn.isEnabled = true
            }else {
                SysUtils.makeToast(message: "전화번호를 입력해주세요.", durationTime: 2, delayTime: 0.1)
            }
        }

    }
}
