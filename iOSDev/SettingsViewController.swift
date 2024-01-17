//
//  SettingsViewController.swift
//  iOSDev
//
//  Created by Камиль Байдиев on 17.01.2024.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func updateProfileData(name: String, surname: String)
}

class SettingsViewController: UIViewController {
    weak var delegate: SettingsViewControllerDelegate?
    
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(someView)
        view.addSubview(textLabel)
        view.addSubview(createTF(placeholder: "Имя"))
        view.addSubview(createTF(placeholder: "Фамилия", offsetY: 60))
        view.addSubview(createBtn)
    }
    
    lazy var textLabel: UILabel = {
        var label = UILabel()
        label.frame.size = CGSize(width: 186, height: 40)
        label.center.x = view.center.x - 72
        label.center.y = view.center.y - 186
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Введите новые данные"
        
        return label
    }()
    
    lazy var someView: UIView = {
        let someViewRectangle = UIView()
        someViewRectangle.frame.size = CGSize(width: 369 - 30, height: 264)
        someViewRectangle.center.x = view.center.x
        someViewRectangle.center.y = view.center.y
        someViewRectangle.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        someViewRectangle.layer.cornerRadius = 20
        
        return someViewRectangle
    }()
    
    func createTF(placeholder: String, offsetY: Double = 0) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = UIColor.white
        textField.textAlignment = .left
        textField.layer.cornerRadius = 30
        textField.placeholder = placeholder
        textField.textColor = .black
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)]
        )
        
        let screenWidth = UIScreen.main.bounds.width
        textField.frame = CGRect(x: 33, y: Int(someView.frame.height + 60) + Int(offsetY), width: Int(screenWidth) - 66, height: 50)
        
        let placeholderTextPadding = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        textField.leftView = placeholderTextPadding
        textField.leftViewMode = .always
        
        return textField
    }
    
    lazy var createBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("Сохранить", for: .normal)
        btn.frame = CGRect(x: 33, y: Int(someView.frame.height + 105 * 2), width: Int(someView.bounds.width) - 30, height: 54)
        btn.center.x = view.center.x
        btn.layer.cornerRadius = 30
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    
    @objc func saveButtonTapped() {
        let nameTextField = view.subviews.compactMap { $0 as? UITextField }.first { $0.placeholder == "Имя" }
        let surnameTextField = view.subviews.compactMap { $0 as? UITextField }.first { $0.placeholder == "Фамилия" }
        
        let name = nameTextField?.text ?? ""
        let surname = surnameTextField?.text ?? ""
        
        delegate?.updateProfileData(name: name, surname: surname)
        navigationController?.popViewController(animated: true)
    }
}
