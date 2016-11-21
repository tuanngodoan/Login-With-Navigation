//
//  ViewController.swift
//  Login_Nagition
//
//  Created by Doãn Tuấn on 11/21/16.
//  Copyright © 2016 doantuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var acc_Text: UITextField!
    @IBOutlet weak var pass_Text: UITextField!
    var user: [String:String] = ["admin":"admin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func checkLogin() -> Bool{
        var check:Bool = false
        if let pass = acc_Text.text {
            if pass == pass_Text.text{
                check = true
            }
        }
         return check
    }
    
    func alertNotif(title: String,mess: String, idef: String){
        let alert = UIAlertController(title: title, message: mess, preferredStyle: UIAlertControllerStyle.alert)
       
        alert.addAction(UIAlertAction(title: "OKE", style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alert, animated: true, completion:
            ({
        
            self.pushView(idef: idef)
            
        }))
        
    }
    func alertNotif(title: String,mess: String){
        let alert = UIAlertController(title: title, message: mess, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OKE", style: UIAlertActionStyle.default, handler:nil))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    func pushView(idef: String){
        let view = self.storyboard?.instantiateViewController(withIdentifier: idef)
        
        self.navigationController?.pushViewController(view!, animated: true)
    }
    
    @IBAction func Login_Button(_ sender: Any) {
        if checkLogin() == true {
            alertNotif(title:"Login Thành Công", mess: "Bạn đã đăng nhập thành công vào tài khoản ",idef: "ViewInfo")
        }else{
            alertNotif(title:"Login NO Thành Công", mess: "Bạn đã đăng nhập NO thành công vào tài khoản ")
        }
        
        }

    @IBAction func Create_button(_ sender: Any) {
        pushView(idef: "ViewCreate")
    }
   
    
    @IBAction func forgot_button(_ sender: Any) {
        pushView(idef: "ViewForgot")
    }
    
}

