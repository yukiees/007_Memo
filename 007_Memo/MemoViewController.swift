//
//  MemoViewController.swift
//  007_Memo
//
//  Created by 松島優希 on 2020/11/16.
//

import UIKit

class MemoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = (saveData.object(forKey: "title") as! String)
        contentTextView.text = (saveData.object(forKey: "content") as! String) 
    }
    
    @IBAction func saveMemo(_ sender: Any) {
        //Userdefaultsに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
    }
    

}
