//
//  ViewController.swift
//  AppleSignInDemo
//
//  Created by Deep Mahajan.
//
import AuthenticationServices
import UIKit

class ViewController: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var btnAppleSignIn: UIButton!
    
    //MARK:- properties
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    //MARK:- Actions
    
    @IBAction func btnAppleSignIn(_ sender: Any) {
        
        let apppleIDProvider = ASAuthorizationAppleIDProvider()
        let request = apppleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
        
    }
    
}

//MARK:- Supporting Fucntions and Methods
extension ViewController: ASAuthorizationControllerDelegate{
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
    if let appleIDCredential = authorization.credential as?  ASAuthorizationAppleIDCredential {
    let userIdentifier = appleIDCredential.user
    let fullName = appleIDCredential.fullName
    let email = appleIDCredential.email
    print("User id is \(userIdentifier) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))") }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error){
        print(error.localizedDescription)
    }
}


