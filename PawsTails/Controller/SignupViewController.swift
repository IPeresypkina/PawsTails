//
//  SignupViewController.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 4/4/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var vwUserName: UIView!
    @IBOutlet weak var vwEmail: UIView!
    @IBOutlet weak var vwPhone: UIView!
    @IBOutlet weak var vwPassword: UIView!
    
    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnSignup: UIButton!
    
    var reachability: Reachability?
    let user: User? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        DesignPart()
    }
    @IBAction func btnSignupTapped(_ sender: Any) {
        if txtUserName.text! != "" && txtEmail.text! != "" && txtPassword.text! != ""
        {
            //call api
            userSignupTapped()
            
        } else
        {
            let alert = UIAlertController(title: "", message: "Please all field are requared", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler:{action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func DesignPart() {
        vwEmail.layer.cornerRadius = 30
        vwEmail.clipsToBounds = true
        
        vwPassword.layer.cornerRadius = 30
        vwPassword.clipsToBounds = true
        
        vwUserName.layer.cornerRadius = 30
        vwUserName.clipsToBounds = true
        
        vwPhone.layer.cornerRadius = 30
        vwPhone.clipsToBounds = true
        
        btnSignup.layer.cornerRadius = 30
        btnSignup.clipsToBounds = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func userSignupTapped() {
        
        do {
            self.reachability = try Reachability.init()
        } catch {
            print("Unable to start notifier ")
        }
        if ((reachability!.connection) != .unavailable)
        {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            let params = [
                "firstName":self.txtUserName.text!.trimmingCharacters(in: .whitespacesAndNewlines) as AnyObject,
                "email":self.txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines) as AnyObject,
                "phone":self.txtPhone.text!.trimmingCharacters(in: .whitespacesAndNewlines) as AnyObject,
                "password":self.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines) as AnyObject,
            ]
            
            guard let encodeURL = URL(string: apiSignup) else {return}
            print(encodeURL)
            var request = URLRequest(url: encodeURL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: params, options: []) else {return}
            request.httpBody = httpBody
                        
            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                if let response = response {
                    print(response)
                } else {
                    let alert = UIAlertController(title: "", message: "Please all field are requared", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "Close", style: .cancel) { action in
                        print("Close")
                    }
                    alert.addAction(closeAction)
                    self!.present(alert, animated: true)
                }
                            
                guard let data = data else {return}
                print(data)
                do {
//                    let json = try JSONDecoder().decode(UserAuthKey.self, from: data)
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
//                    self.user?.authKey = json?["authKey"] as! String

                    
                    // Login success
                    if (json as AnyObject).count != nil {
                        DispatchQueue.main.async {
                            let mainstoryboard = UIStoryboard(name: "Main", bundle: .main)
                            let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "TabViewController")
                            newViewController.modalPresentationStyle = .fullScreen
                            self!.present(newViewController, animated: true)
                        }
                    } else {
                        let alert = UIAlertController(title: "", message: "Please all field are requared", preferredStyle: .alert)
                        let closeAction = UIAlertAction(title: "Close", style: .cancel) { action in
                        print("Close")
                        }
                        alert.addAction(closeAction)
                        self!.present(alert, animated: true)
                    }
                } catch {
                    print(error)
                    let alert = UIAlertController(title: "", message: "App cannot connect to server", preferredStyle: .alert)
                    let closeAction = UIAlertAction(title: "Close", style: .cancel) { action in
                        print("Close")
                    }
                    alert.addAction(closeAction)
                    self!.present(alert, animated: true, completion: nil)
                }
            }.resume()
            
            
        } else
        {
            let alert = UIAlertController(title: "", message: "Please check your Internet", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.cancel, handler:{action in
                print("Close")
            })
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
    }

}
