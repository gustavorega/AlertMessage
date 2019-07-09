//
//  DropMessageView.swift
//  Warzone
//
//  Created by Ager on 08/07/2019.
//  Copyright © 2019 Gustavo Rega de Souza. All rights reserved.
//

import UIKit

enum AlertFrom: Int {
    case top
    case bottom
}

class AlertMessage: UIView {
    
    var alertColor: UIColor = .white
    
    var alertHeight: CGFloat = 100
    
    var alertText: String = ""
    
    var alertTextColor: UIColor = .black
    
    var alertTime: Double = 4
    
    var alertFrom: AlertFrom = .top
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 8
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func showAlert(withMessage msg:String, inRootView: UIView){
        self.alertText = msg
        inRootView.addSubview(self)
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        
        if self.superview == nil {
            return
        }
        
        if self.alertFrom == .top {
            self.frame = CGRect(x: 0, y: -alertHeight, width: (self.superview?.frame.width)!, height: alertHeight)
        }
        
        if self.alertFrom == .bottom {
            self.frame = CGRect(x: 0, y: (self.superview?.frame.height)!, width: (self.superview?.frame.width)!, height: alertHeight)
        }
        
        
        
        self.frame.size = CGSize(width: self.frame.width, height: alertHeight)
        
        self.backgroundColor = alertColor
        
        let messageLabel : UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = self.alertTextColor
            label.text = self.alertText
            label.font = .systemFont(ofSize: 18)
            label.numberOfLines = 0
            label.minimumScaleFactor = 0.7
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
            return label
        }()
        
        self.addSubview(messageLabel)
        
        messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1, constant: -20).isActive = true
        if self.alertFrom == .top {
            messageLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        }
        if self.alertFrom == .bottom {
            messageLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        }
        
        
        UIView.animate(withDuration: 0.6, animations: {
            if self.alertFrom == .top {
                self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
            }
            if self.alertFrom == .bottom {
                self.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
            }
        }) { (completou) in
            
            if completou {
                
                UIView.animate(withDuration: 1.4, delay: self.alertTime, options: .curveEaseIn, animations: {
                    if self.alertFrom == .top {
                        self.transform = CGAffineTransform(translationX: 0, y: -self.frame.height)
                    }
                    if self.alertFrom == .bottom {
                        self.transform = CGAffineTransform(translationX: 0, y: self.frame.height)
                    }
                }, completion: { (completou) in
                    if completou {
                        self.removeFromSuperview()
                    }
                })
                
            }
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
