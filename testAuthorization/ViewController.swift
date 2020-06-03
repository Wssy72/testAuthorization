//
//  ViewController.swift
//  testAuthorization
//
//  Created by Sergey on 01.06.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataDecodeUser = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        requestServer()
    }
    func requestServer() {
        print("создали запрос")
        let url = URL(string: "http://37.140.199.187:3000/auth/login")!
        print("create url")
        let parameters: [String: Any] = ["username": "guest",
         "password": "guest"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
        } catch let error {
             print(error.localizedDescription)
        }
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print("Сделаны настройки запроса")
        
        let task: Void = URLSession.shared.dataTask(with: request) { (data, response, error) in
        print("запрос получен")
        
        if let response = response {
            print(response)
            }
            if let data = data, let str = String(decoding: data, as: UTF8.self) as? String {
                print("data: \(str)")
                //let answerData =
            }
            if let data = data {
                let answer: User = try! JSONDecoder().decode(User.self, from: data)
                print(answer, "Декодированный ответ")
                DispatchQueue.main.async {
                self.transitionTwoController(answer: answer)
                }
            }
            if let error = error {
                print(error)
            }
        } .resume()
    print("запрос отправлен")
    
  }
    
    func transitionTwoController(answer: User) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let twoViewController = storyboard.instantiateViewController(identifier: "2VC") as! TwoViewController
       //let twoViewController: TwoViewController = TwoViewController()
        twoViewController.dataUser = answer
        self.present(twoViewController, animated: true, completion: nil)
        
    }

}


