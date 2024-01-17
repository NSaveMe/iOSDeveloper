//
//  ViewController.swift
//  iOSDev
//
//  Created by Камиль Байдиев on 17.01.2024.
//

import UIKit

protocol ViewControllerDelegate: AnyObject {
    func setLabelText(text: String)
    func setTitle(title: String)
}

class MainViewController: UIViewController, ViewControllerDelegate {
    
    func setLabelText(text: String) {
        self.nameLabel.text = text
        self.surnameLabel.text = text
    }
    
    func setTitle(title: String) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(profileImage)
        view.addSubview(nameLabel)
        view.addSubview(surnameLabel)
        view.addSubview(settingsBtnLabel)
        view.addSubview(someView)
        view.addSubview(imageView)
    }
    
    lazy var profileImage: UIImageView = {
        let image = UIImageView(image: UIImage(named: "profileImage"))
        image.frame.size = CGSize(width: 100, height: 100)
        image.center.x = view.center.x
        image.frame.origin.y = view.frame.origin.y + 172
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 300, height: 25)
        label.center.x = view.center.x
        label.frame.origin.y = profileImage.center.y + 50
        label.text = "Имя"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var surnameLabel: UILabel = {
        let label = UILabel()
        label.frame.size = CGSize(width: 300, height: 25)
        label.center.x = view.center.x
        label.frame.origin.y = nameLabel.frame.origin.y + nameLabel.frame.size.height
        label.text = "Фамилия"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    lazy var settingsBtnLabel: UIButton = {
        let settingsLabel = UIButton()
        settingsLabel.frame.size = CGSize(width: 86, height: 19)
        settingsLabel.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        settingsLabel.frame.origin.y = surnameLabel.frame.origin.y + surnameLabel.frame.size.height + 16
        settingsLabel.center.x = view.center.x
        settingsLabel.setTitle("Настройки", for: .normal)
        settingsLabel.setTitleColor(.blue, for: .normal)
        settingsLabel.addTarget(self, action: #selector(settingsBtnLabelTapped), for: .touchUpInside)
        return settingsLabel
    }()
    
    lazy var someView: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 109, height: 79)
        view.center.x = self.view.center.x
        view.frame.origin.y = settingsBtnLabel.frame.origin.y + settingsBtnLabel.frame.size.height + 31
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Image"))
        image.frame.size = CGSize(width: 369, height: 332)
        image.center.x = view.center.x
        image.center.y = someView.center.y + 231
        image.layer.cornerRadius = 20
        return image
    }()
    
    @objc func settingsBtnLabelTapped() {
        let settingsVC = SettingsViewController()
        settingsVC.delegate = self
        self.navigationController?.pushViewController(settingsVC, animated: true)
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func updateProfileData(name: String, surname: String) {
        nameLabel.text = name
        surnameLabel.text = surname
    }
}
