//
//  TwoViewController.swift
//  testAuthorization
//
//  Created by Sergey on 02.06.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController {
    
    var dataUser: User?
    

    @IBOutlet weak var labelDataUser: UILabel!
    @IBOutlet weak var labelDataUserTwo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelDataUser.text = dataUser?.id
        labelDataUserTwo.text = dataUser?.login
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
