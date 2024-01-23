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
    
    var nameTextField: UITextField!
    var surnameTextField: UITextField!

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Введите новые данные"
        return label
    }()
    
    lazy var someView: UIView = {
        let someViewRectangle = UIView()
        someViewRectangle.translatesAutoresizingMaskIntoConstraints = false
        someViewRectangle.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        someViewRectangle.layer.cornerRadius = 20
        return someViewRectangle
    }()
    
    // Cоздание текстового поля
    func createTF(placeholder: String, offsetY: CGFloat = 0) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor.white
        textField.textAlignment = .left
        textField.layer.cornerRadius = 30
        textField.placeholder = placeholder
        textField.textColor = .black
        
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)]
        )
        
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: offsetY + 20),
            textField.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let placeholderTextPadding = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 50))
        textField.leftView = placeholderTextPadding
        textField.leftViewMode = .always
        
        return textField
    }
    
    lazy var createBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Сохранить", for: .normal)
        btn.layer.cornerRadius = 30
        btn.backgroundColor = .black
        btn.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
        
        btn.addTarget(self, action: #selector(buttonTouchDown(_:)), for: .touchDown)
        btn.addTarget(self, action: #selector(buttonTouchUpInside(_:)), for: .touchUpInside)
        btn.addTarget(self, action: #selector(buttonTouchUpOutside(_:)), for: .touchUpOutside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(someView)
        view.addSubview(textLabel)
        nameTextField = createTF(placeholder: "Имя", offsetY: 60)
        surnameTextField = createTF(placeholder: "Фамилия", offsetY: 120)
        view.addSubview(nameTextField)
        view.addSubview(surnameTextField)
        view.addSubview(createBtn)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Констрейнты для textLabel
            textLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 220),
            textLabel.leadingAnchor.constraint(equalTo: someView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: someView.trailingAnchor, constant: -20),
            
            // Констрейнты для someView
            someView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -132),
            someView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            someView.widthAnchor.constraint(equalToConstant: 369 - 30),
            someView.heightAnchor.constraint(equalToConstant: 264),
            
            // Констрейнты для createBtn
            createBtn.topAnchor.constraint(equalTo: someView.centerYAnchor, constant: 50),
            createBtn.leadingAnchor.constraint(equalTo: textLabel.leadingAnchor),
            createBtn.trailingAnchor.constraint(equalTo: textLabel.trailingAnchor),
            createBtn.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    
    @objc func buttonTouchDown(_ sender: UIButton) {
        print("Вы коснулись кнопки: \(String(describing: sender.titleLabel?.text))")
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            sender.alpha = 0.8
        }
    }
    
    @objc func buttonTouchUpInside(_ sender: UIButton) {
            print("Вы нажали кнопку: \(String(describing: sender.titleLabel?.text))")
            UIView.animate(withDuration: 0.1) {
                sender.transform = .identity
                sender.alpha = 1.0
            }

            // Получение данных из TF
            guard let name = nameTextField.text, !name.isEmpty,
                  let surname = surnameTextField.text, !surname.isEmpty else {
                nameTextField.text = "Имя"
                surnameTextField.text = "Фамилия"
                
                delegate?.updateProfileData(name: nameTextField.text!, surname: surnameTextField.text!)  // Дублирование кода для TF
                
                // Передача данных на MainVC
                navigationController?.popViewController(animated: true) // Дублирование кода для TF

                return
            }
            
            delegate?.updateProfileData(name: name, surname: surname) // Дублирование кода для TF
            
            // Передача данных на MainVC
            navigationController?.popViewController(animated: true) // Дублирование кода для TF
        }
    
    @objc func buttonTouchUpOutside(_ sender: UIButton) {
        print("Вы отменили нажатии кнопки: \(String(describing: sender.titleLabel?.text))")
        UIView.animate(withDuration: 0.1) {
            sender.transform = .identity
            sender.alpha = 1.0
        }
    }
}
