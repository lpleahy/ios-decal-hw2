//
//  KeyboardViewController.swift
//  CalKeyboard
//
//  Created by Gene Yoo on 9/15/15.
//  Copyright © 2015 iOS Decal. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    @IBOutlet var sadButton: UIButton!
    @IBOutlet var neutralButton: UIButton!
    @IBOutlet var smileyButton: UIButton!
    @IBOutlet var returnButton: UIButton!

    var keyboardView: UIView!

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInterface()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
    }

    func loadInterface() {
        let keyboardNib = UINib(nibName: "Keyboard", bundle: nil)
        keyboardView = keyboardNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        keyboardView.frame = view.frame
        view.addSubview(keyboardView)
        view.backgroundColor = keyboardView.backgroundColor
        nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside) // advanceToNextInputMode is already defined in template
        deleteKeyboardButton.addTarget(self, action: "delete", forControlEvents: .TouchUpInside)
        sadButton.addTarget(self, action: "sad", forControlEvents: .TouchUpInside)
        smileyButton.addTarget(self, action: "smiley", forControlEvents: .TouchUpInside)
        neutralButton.addTarget(self, action: "neutral", forControlEvents: .TouchUpInside)
        returnButton.addTarget(self, action: "returnFunc", forControlEvents: .TouchUpInside)
    }
    
    func delete() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    func sad() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(":-(")
    }
    
    func neutral() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(":-|")
    }
    
    func smiley() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(":-)")
    }
    
    func returnFunc() {
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText("\n")
    }
}
