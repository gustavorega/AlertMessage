# AlertMessage
Simple and easy to user Alert for iOS Swift Projects

![alt text](https://raw.githubusercontent.com/gustavorega/AlertMessage/master/alertMessage.gif)

## Instalation

Just copy the file "AlertMessage.swift" to your project.

## Usage

```
  let myAlert = AlertMessage()
  myAlert.alertFrom = .top // .bottom
  myAlert.showAlert(withMessage: "This is my message alert from TOP!", inRootView: self.view)
```

## Options

```
  myAlert.alertFrom = .top | .bottom //Default is .top
  myAlert.alertColor = UIColor // Default is .white
  myAlert.alertTextColor = UIColor // Default is .black
  myAlert.alertHeight = CGFloat // Default is 100
  myAlert.alertTime = Double // Default is 4
