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
        view.addSubview(someViewInCenter)
        view.addSubview(imageView)
        view.addSubview(someViewLeft)
        view.addSubview(someViewRight)
        someViewLeft.addSubview(friendsCountLabel)
        someViewLeft.addSubview(friendsCountTxtLabel)
        someViewInCenter.addSubview(subsCountLabel)
        someViewInCenter.addSubview(subsCountTxtLabel)
        someViewRight.addSubview(favoriteCountLabel)
        someViewRight.addSubview(favoriteCountTxtLabel)
        
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
        label.center.x = view.center.x - 35
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
        label.center.x = view.center.x + 35
        label.frame.origin.y = profileImage.center.y + 50
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
        settingsLabel.frame.origin.y = surnameLabel.frame.origin.y + surnameLabel.frame.size.height + 10
        settingsLabel.center.x = view.center.x
        settingsLabel.setTitle("Настройки", for: .normal)
        settingsLabel.setTitleColor(.blue, for: .normal)
        settingsLabel.addTarget(self, action: #selector(settingsBtnLabelTapped), for: .touchUpInside)
        return settingsLabel
    }()
    
    lazy var someViewLeft: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 109, height: 79)
        view.frame.origin.x = 10
        view.frame.origin.y = settingsBtnLabel.frame.origin.y + settingsBtnLabel.frame.size.height + 31
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        
        
        return view
    }()
    
    lazy var friendsCountLabel: UILabel = {
        let viewLabel = UILabel()
        viewLabel.text = "10"
        viewLabel.frame = someViewLeft.bounds
        viewLabel.frame.origin.x = viewLabel.frame.origin.x + 10
        viewLabel.frame.origin.y = viewLabel.frame.origin.y - 10
        viewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        return viewLabel
    }()
    
    lazy var friendsCountTxtLabel: UILabel = {
        let friendCountTxt = UILabel()
        friendCountTxt.text = "Друзей"
        friendCountTxt.frame = someViewLeft.bounds
        friendCountTxt.frame.origin.x = friendCountTxt.frame.origin.x + 10
        friendCountTxt.frame.origin.y = friendCountTxt.frame.origin.y + 10
        
        return friendCountTxt
    }()
    
    lazy var someViewInCenter: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 109, height: 79)
        view.center.x = self.view.center.x
        view.frame.origin.y = settingsBtnLabel.frame.origin.y + settingsBtnLabel.frame.size.height + 31
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var subsCountLabel: UILabel = {
        let viewLabel = UILabel()
        viewLabel.text = "20"
        viewLabel.frame = someViewInCenter.bounds
        viewLabel.frame.origin.x = viewLabel.frame.origin.x + 10
        viewLabel.frame.origin.y = viewLabel.frame.origin.y - 10
        viewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        return viewLabel
    }()
    
    lazy var subsCountTxtLabel: UILabel = {
        let friendCountTxt = UILabel()
        friendCountTxt.text = "Подписок"
        friendCountTxt.frame = someViewInCenter.bounds
        friendCountTxt.frame.origin.x = friendCountTxt.frame.origin.x + 10
        friendCountTxt.frame.origin.y = friendCountTxt.frame.origin.y + 10
        
        return friendCountTxt
    }()
    
    lazy var someViewRight: UIView = {
        let view = UIView()
        view.frame.size = CGSize(width: 109, height: 79)
        view.frame.origin.x = self.view.frame.width - 119
        view.frame.origin.y = settingsBtnLabel.frame.origin.y + settingsBtnLabel.frame.size.height + 31
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var favoriteCountLabel: UILabel = {
        let viewLabel = UILabel()
        viewLabel.text = "30"
        viewLabel.frame = someViewRight.bounds
        viewLabel.frame.origin.x = viewLabel.frame.origin.x + 10
        viewLabel.frame.origin.y = viewLabel.frame.origin.y - 10
        viewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        return viewLabel
    }()
    
    lazy var favoriteCountTxtLabel: UILabel = {
        let favoriteCountTxt = UILabel()
        favoriteCountTxt.text = "Избранных"
        favoriteCountTxt.frame = someViewRight.bounds
        favoriteCountTxt.frame.origin.x = favoriteCountTxt.frame.origin.x + 10
        favoriteCountTxt.frame.origin.y = favoriteCountTxt.frame.origin.y + 10
        favoriteCountTxt.font = UIFont.systemFont(ofSize: 16)
        
        return favoriteCountTxt
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Image"))
        image.frame.size = CGSize(width: 369, height: 332)
        image.center.x = view.center.x
        image.center.y = someViewInCenter.center.y + 231
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
