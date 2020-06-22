//
//  ViewController.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 4/3/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var vwEmail: UIView!
    
    @IBOutlet weak var wvPassword: UIView!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    var reachability:Reachability?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        DesignPart()
    }


    @IBAction func btnLoginTapped(_ sender: Any) {
        if txtEmail.text != "" || txtPassword.text! != "" {
            userLoginTapped()
        }
    }
    
    @IBAction func btnSignupTapped(_ sender: Any) {
        let mainstoryboard = UIStoryboard(name: "Main", bundle: .main)
        let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "SignupViewController")
        present(newViewController, animated: true)
    }
    
    func DesignPart() {
        vwEmail.layer.cornerRadius = 30
        vwEmail.clipsToBounds = true
        
        wvPassword.layer.cornerRadius = 30
        wvPassword.clipsToBounds = true
        
        btnLogin.layer.cornerRadius = 30
        btnLogin.clipsToBounds = true
    }
    
    func userLoginTapped() {
        do {
            self.reachability = try Reachability()
        } catch {
            print("Unable to start notifier ")
        }
        if ((reachability!.connection) != .unavailable)
        {
            MBProgressHUD.showAdded(to: self.view, animated: true)
            let params = [
                "email": self.txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines),
                "password": self.txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            ]
    
            guard let encodeURL = URL(string: apiLoginup) else {return}
            print(encodeURL)
            var request = URLRequest(url: encodeURL)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: params) else {return}
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                  
                    let count = json?.count
                    
                    // Login success
                    if count != nil {
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
            
        } else {
            let alert = UIAlertController(title: "", message: "Please check your Internet", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Close", style: .cancel) { action in
                print("Close")
            }
            alert.addAction(closeAction)
            present(alert, animated: true)
        }
    }
    
}
