//
//  ProfileUserViewController.swift
//  PawsTails
//
//  Created by Ирина Пересыпкина on 5/5/20.
//  Copyright © 2020 Ирина Пересыпкина. All rights reserved.
//

import UIKit

class ProfileUserViewController: UIViewController {
    
    private let userService = ServiceAssembly.shared.userService()
    
    var userProfile: UserViewModel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var FIO: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfile()
        FIO.text = userProfile.fio
        email.text = userProfile.email
        phone.text = userProfile.phone
    }
    
    @IBAction func AddPets(_ sender: Any) {
        let mainstoryboard = UIStoryboard(name: "Main", bundle: .main)
        let newViewController = mainstoryboard.instantiateViewController(withIdentifier: "ListPetsViewController")
        present(newViewController, animated: true)
    }
    @IBAction func logout(_ sender: Any) {
        
    }
    
    func setupProfile() {
        guard let encodeURL = URL(string: apiGetUser) else {return}
        URLSession.shared.dataTask(with: encodeURL) { (data, response, error) in
            if let response = response {
                print(response)
            }
            guard let data = data else {return}
            print(data)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary
                print(json)
                self?.user.authKey = json?["authKey"] as! String
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
