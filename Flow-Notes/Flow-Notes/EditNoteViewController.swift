//
//  EditNoteViewController.swift
//  Flow-Notes
//
//  Created by Faris Sbahi on 12/26/17.
//  Copyright © 2017 Pauca, Inc. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var node: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        textView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}

extension EditNoteViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print("text view did change")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("text view did end editing")
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("text view did begin editing")
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("text view should change text in")
        return true
    }
}
