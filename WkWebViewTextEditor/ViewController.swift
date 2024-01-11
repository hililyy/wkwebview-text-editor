//
//  ViewController.swift
//  WkWebViewTextEditor
//
//  Created by 강조은 on 2024/01/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var editorView: RichEditorView!

    lazy var toolbar: RichEditorToolbar = {
        let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        toolbar.options = RichEditorDefaultOption.all
        return toolbar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editorView.inputAccessoryView = toolbar
        toolbar.editor = editorView
    }

}
