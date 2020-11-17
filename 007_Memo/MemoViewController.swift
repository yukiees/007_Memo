//
//  MemoViewController.swift
//  007_Memo
//
//  Created by 松島優希 on 2020/11/16.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.text = (saveData.object(forKey: "title") as? String)
        contentTextView.text = (saveData.object(forKey: "content") as? String)
        titleTextField.delegate = self
    }
    
    @IBAction func saveMemo(_ sender: Any) {
        //Userdefaultsに書き込み
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title:"保存",message: "メモの保存が完了しました",preferredStyle: .alert)
        
        alert.addAction(
                UIAlertAction(
                            title:"OK",
                            style: .default,
                            handler: { action in
                                //ボタンが押されたときの動作
                                self.navigationController?.popViewController(animated: true)
                            }
                )
        )
        
        present(alert, animated: true, completion:nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

}
