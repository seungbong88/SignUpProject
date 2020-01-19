//
//  SignUpViewController.swift
//  SignUp
//
//  Created by seungbong on 2020/01/18.
//  Copyright © 2020 한승희. All rights reserved.
//

// 리스너 달고, 입력 다되면은 다음버튼 활성화 (색변경)
// 

import UIKit

class SignUpViewController_first: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()
    
    @IBOutlet weak var userProfile: UIButton!
    @IBOutlet weak var selectProfileText: UILabel!
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPW: UITextField!
    @IBOutlet weak var userPwCheck: UITextField!
    @IBOutlet weak var userIntroduction: UITextView!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    @IBAction func clickedProfileBtn(_ sender: UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }

    @IBAction func clickCancelBtn(_ sender: Any) {
        self.dismiss(animated:true, completion: nil)
    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            userProfile.setBackgroundImage(userImage, for: .normal)
            userProfile.setTitle("", for: .normal)
            selectProfileText.text = ""
        }else{
            print("이미지를 불러올 수 없습니다.")
        }
        self.imagePicker.dismiss(animated: true, completion: nil)

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedScreen(_ sender: Any) {
        self.view.endEditing(true)
    
        let id = userID.text ?? ""
        let pw = userPW.text ?? ""
        let pw_check = userPwCheck.text ?? ""
        
        if id.count > 0 {
            if pw.count > 0 {
                if pw.count == pw_check.count {
                    nextBtn.isEnabled = true
                    nextBtn.setTitleColor(self.view.tintColor, for: .normal)
                    saveUserData()
                }else {
                    SysUtils.makeToast(message: "비밀번호가 일치하지 않습니다.", durationTime: 2, delayTime: 0.1)
                    userPwCheck.becomeFirstResponder()
                }
            }else {
                SysUtils.makeToast(message: "비밀번호를 입력해주세요.", durationTime: 2, delayTime: 0.1)
                userPW.becomeFirstResponder()
            }
        }else{
            SysUtils.makeToast(message: "아이디를 입력해주세요.", durationTime: 2, delayTime: 0.1)
            userID.becomeFirstResponder()
        }
    }
    
    func saveUserData() {
        UserInformation.UserShared.id = self.userID.text!
        UserInformation.UserShared.password = self.userPW.text!
        UserInformation.UserShared.introduction = self.userIntroduction.text ?? ""
        
        // imageUrl 저장
        // 근데 여기서 바로 저장하면 안될듯 일단 DatePicker하러 고고~
    }

}
