//
//  CustomToolBar.swift
//  RichEditorViewSample
//
//  Created by 강조은 on 2024/01/10.
//  Copyright © 2024 Caesar Wirth. All rights reserved.
//

//import UIKit
//
//class CustomToolBar: UIView {
//    
//    lazy var toolView: UIView = {
//        let view = UIView()
//        view.backgroundColor = Asset.Color.gray7.color
//        view.frame = CGRect(x: 0.0, y: 0.0, width: UIScreen.main.bounds.width, height: 44.0)
//        return view
//    }()
//    
//    let toolNumberButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(Asset.Image.icFormNumber.image, for: .normal)
//        button.tintColor = Asset.Color.gray14.color
//        return button
//    }()
//    
//    let toolDotListButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(Asset.Image.icFormCircle.image, for: .normal)
//        button.tintColor = Asset.Color.gray14.color
//        return button
//    }()
//    
//    let toolDashListButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(Asset.Image.icFormLine.image, for: .normal)
//        button.tintColor = Asset.Color.gray14.color
//        return button
//    }()
//    
//    let toolInlineButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(Asset.Image.icFormInline.image, for: .normal)
//        button.tintColor = Asset.Color.gray14.color
//        return button
//    }()
//    
//    let toolOutlineButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(Asset.Image.icFormOutline.image, for: .normal)
//        button.tintColor = Asset.Color.gray14.color
//        return button
//    }()
//    
//    lazy var toolStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.spacing = 50
//        stackView.axis = .horizontal
//        stackView.distribution = .equalSpacing
//        stackView.alignment = .fill
//        return stackView
//    }()
//}
