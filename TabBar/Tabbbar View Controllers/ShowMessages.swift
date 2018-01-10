//
//  ShowMessages.swift
//  FB
//
//  Created by Panagiotis  Kompotis  on 05/01/2018.
//  Copyright © 2018 Panagiotis  Kompotis. All rights reserved.
//

import UIKit

class ShowMessages: UIViewController, UITextFieldDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        //plusButton.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 234)
        plusButton.backgroundColor = UIColor.rgb(red: 10, green: 152, blue: 249)
        self.messangerTextBox.delegate = self
        
        
        messangerButtonsActionsSetup()
        setupViews()
    }
    
    
    
    let bottomView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230)
        return view
    }()
    
    let messangerTextBox: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.placeholder = " Aa"
        textField.layer.cornerRadius = 10
            return textField
    }()

    let plusButton: UIButton = ShowMessages.createMessagerButtons(imageName: "plusButton")
    
    let cameraButton: UIButton = ShowMessages.createMessagerButtons(imageName: "camera-icon")
    let addPhotos: UIButton = ShowMessages.createMessagerButtons(imageName: "addPhotosIcon")
    let recordAudioButton: UIButton = ShowMessages.createMessagerButtons(imageName: "micIcon")
    let likeButton: UIButton = ShowMessages.createMessagerButtons(imageName: "LIKE_Color_Filled")
    
    
   static func createMessagerButtons(imageName: String?) -> UIButton{
        let button = UIButton()
        //button.layer.cornerRadius = 0.41666667 * 33
        button.layer.cornerRadius = 0.41666667 * 23
    if let imageName = imageName{
        button.setImage(UIImage(named: imageName), for: .normal)
    }
        return button
    }
    
    
    
    
    func setupViews() {
        view.addSubview(bottomView)
        view.addSubview(plusButton)
        view.addSubview(cameraButton)
        view.addSubview(addPhotos)
        view.addSubview(recordAudioButton)
        view.addSubview(messangerTextBox)
        view.addSubview(likeButton)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: bottomView)
        //view.addConstraintsWithFormat(format: "V:[v0(49)]-49-|", views: bottomView)
        
        if UIDevice().type == Model.iPhoneX{
                view.addConstraintsWithFormat(format: "V:[v0(49)]-76-|", views: bottomView)
            
                view.addConstraintsWithFormat(format: "H:|-8-[v0(v1)]-8-[v1]-8-[v2(v1)]-8-[v3(v1)]-8-[v4(150)]-8-[v5(v1)]-8-|", views: plusButton, cameraButton, addPhotos, recordAudioButton, messangerTextBox, likeButton)
            
            
                view.addConstraintsWithFormat(format: "V:[v0]-92-|", views: plusButton)
                view.addConstraintsWithFormat(format: "V:[v0]-90-|", views: cameraButton)
                view.addConstraintsWithFormat(format: "V:[v0]-90-|", views: addPhotos)
                view.addConstraintsWithFormat(format: "V:[v0]-90-|", views: recordAudioButton)
                view.addConstraintsWithFormat(format: "V:[v0]-90-|", views: messangerTextBox)
                view.addConstraintsWithFormat(format: "V:[v0]-90-|", views: likeButton)
        }else{
            
        
        
        /*view.addConstraintsWithFormat(format: "H:|-8-[v0(23)]-8-[v1(33)]-8-[v2(33)]-8-[v3(33)]-8-[v4(150)]-8-[v5]-8-|", views: plusButton, cameraButton, addPhotos, recordAudioButton, messangerTextBox, likeButton)
        
        
        view.addConstraintsWithFormat(format: "V:[v0(23)]-60-|", views: plusButton)
        view.addConstraintsWithFormat(format: "V:[v0(33)]-55-|", views: cameraButton)
        view.addConstraintsWithFormat(format: "V:[v0(33)]-55-|", views: addPhotos)
        view.addConstraintsWithFormat(format: "V:[v0(33)]-55-|", views: recordAudioButton)
        view.addConstraintsWithFormat(format: "V:[v0(33)]-56-|", views: messangerTextBox)
        view.addConstraintsWithFormat(format: "V:[v0(33)]-60-|", views: likeButton)
        */
        
        view.addConstraintsWithFormat(format: "V:[v0(49)]-49-|", views: bottomView)
        view.addConstraintsWithFormat(format: "H:|-8-[v0(v1)]-8-[v1]-8-[v2(v1)]-8-[v3(v1)]-8-[v4(150)]-8-[v5(v1)]-8-|", views: plusButton, cameraButton, addPhotos, recordAudioButton, messangerTextBox, likeButton)
        
        
            view.addConstraintsWithFormat(format: "V:[v0]-60-|", views: plusButton)
            view.addConstraintsWithFormat(format: "V:[v0]-55-|", views: cameraButton)
            view.addConstraintsWithFormat(format: "V:[v0]-55-|", views: addPhotos)
            view.addConstraintsWithFormat(format: "V:[v0]-55-|", views: recordAudioButton)
            view.addConstraintsWithFormat(format: "V:[v0]-56-|", views: messangerTextBox)
            view.addConstraintsWithFormat(format: "V:[v0]-60-|", views: likeButton)
        
        }
        
        }
  
    func messangerButtonsActionsSetup(){
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: UIControlEvents.touchDown)
        cameraButton.addTarget(self, action: #selector(cameraButtonPressed), for: UIControlEvents.touchDown)
        addPhotos.addTarget(self, action: #selector(addPhotosButtonPressed), for: UIControlEvents.touchDown)
        recordAudioButton.addTarget(self, action: #selector(recordAudioButtonPressed), for: UIControlEvents.touchDown)
        messangerTextBox.addTarget(self, action: #selector(messangerTextBoxPressed), for: UIControlEvents.touchDown)
        
        likeButton.addTarget(self, action: #selector(likeButtonMessagesPressed), for: UIControlEvents.touchDown)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.messangerTextBox.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
        if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone{
            moveTextField(textfield: textField, moveDistance: -200, up: true)
        }
        //adjust moveTextField method parameters based on the type of the device
        if UIDevice().type == Model.iPhone6plus{
            moveTextField(textfield: textField, moveDistance: -20, up: true)
        }
        if UIDevice().type == Model.iPhone6Splus{
            moveTextField(textfield: textField, moveDistance: -20, up: true)
        }
        
        if UIDevice().type == Model.iPhone7{
            moveTextField(textfield: textField, moveDistance: -9, up: true)
        }
        if UIDevice().type == Model.iPhone7plus{
            moveTextField(textfield: textField, moveDistance: -20, up: true)
        }
        
        if UIDevice().type == Model.iPhone8{
            moveTextField(textfield: textField, moveDistance: -9, up: true)
        }
        if UIDevice().type == Model.iPhone8plus{
            moveTextField(textfield: textField, moveDistance: -9, up: true)
        }
        if UIDevice().type == Model.iPhoneSE{
            moveTextField(textfield: textField, moveDistance: -4, up: true)
        }
        if UIDevice().type == Model.iPhoneX{
            moveTextField(textfield: textField, moveDistance: -45, up: true)
        }
            
        else if UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad{
            moveTextField(textfield: textField, moveDistance: -263, up: true)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if UIDevice.current.userInterfaceIdiom == .phone{
            moveTextField(textfield: textField, moveDistance: -200, up: false)
        }
            
        if UIDevice().type == Model.iPhone6plus{
            moveTextField(textfield: textField, moveDistance: -20, up: false)
        }
        if UIDevice().type == Model.iPhone6Splus{
            moveTextField(textfield: textField, moveDistance: -20, up: false)
        }
        if UIDevice().type == Model.iPhone7{
            moveTextField(textfield: textField, moveDistance: -9, up: false)
        }
            
        if UIDevice().type == Model.iPhone7plus{
            moveTextField(textfield: textField, moveDistance: -20, up: false)
        }
        if UIDevice().type == Model.iPhone8{
            moveTextField(textfield: textField, moveDistance: -9, up: false)
        }
            
        if UIDevice().type == Model.iPhone8plus{
            moveTextField(textfield: textField, moveDistance: -9, up: false)
        }
            
        if UIDevice().type == Model.iPhoneSE{
            moveTextField(textfield: textField, moveDistance: -4, up: false)
        }
        if UIDevice().type == Model.iPhoneX{
            moveTextField(textfield: textField, moveDistance: -45, up: false)
        }
            
        else if UIDevice.current.userInterfaceIdiom == .pad{
            moveTextField(textfield: textField, moveDistance: -263, up: false)
        }
        messangerTextBox.resignFirstResponder()
        
    }
    
    
    
    @objc func plusButtonPressed(sender: UIButton){
        self.messangerTextBox.resignFirstResponder()
    }
    
    @objc func cameraButtonPressed(sender: UIButton){
        print("Camera button pressed")
        cameraButton.showsTouchWhenHighlighted = true
        self.messangerTextBox.resignFirstResponder()
        }
    
    @objc func addPhotosButtonPressed(sender: UIButton){
        print("add photos button pressed")
        addPhotos.showsTouchWhenHighlighted = true
        self.messangerTextBox.resignFirstResponder()
    }
    @objc func recordAudioButtonPressed(sender: UIButton){
        print("record button pressed")
        recordAudioButton.showsTouchWhenHighlighted = true
        self.messangerTextBox.resignFirstResponder()
    }
    @objc func likeButtonMessagesPressed(sender: UIButton){
        print("Messages like button pressed")
        likeButton.showsTouchWhenHighlighted = true
        self.messangerTextBox.resignFirstResponder()
    }
    @objc func messangerTextBoxPressed(sender: UITextField){
        print("Messager text field pressed")
        self.messangerTextBox.becomeFirstResponder()
    }
    
    
    func moveTextField(textfield: UITextField, moveDistance: Float, up: Bool) {
        let moveDuration = 0.3
        let movement: CGFloat = CGFloat(up ? moveDistance : -moveDistance)
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(moveDuration)
        self.view.frame = view.frame.offsetBy(dx: 0, dy: movement)
        /*self.bottomView.frame = bottomView.frame.offsetBy(dx: 0, dy: movement)
        self.plusButton.frame = self.plusButton.frame.offsetBy(dx: 0, dy: movement)
        self.cameraButton.frame = self.cameraButton.frame.offsetBy(dx: 0, dy: movement)
        self.addPhotos.frame = self.addPhotos.frame.offsetBy(dx: 0, dy: movement)
        self.recordAudioButton.frame = self.recordAudioButton.frame.offsetBy(dx: 0, dy: movement)
        self.messangerTextBox.frame = self.messangerTextBox.frame.offsetBy(dx: 0, dy: movement)
        self.likeButton.frame = self.likeButton.frame.offsetBy(dx: 0, dy: movement)
         */
        UIView.commitAnimations()
    }
    
    
}


