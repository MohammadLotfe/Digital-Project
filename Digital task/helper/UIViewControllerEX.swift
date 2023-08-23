//
//  UIViewControllerEX.swift
//  Digital task
//
//  Created by mohmmadlotfe on 22/08/2023.
//
import UIKit
import MBProgressHUD
import SwiftMessages

extension UIViewController{
    
    func ShowLoading(status:String,View: UIView){

        MBProgressHUD.hide(for: View, animated: true)
        var hud = MBProgressHUD()
        if(status == "Show")
        {
            hud = MBProgressHUD.showAdded(to: View, animated: true)
            hud.minSize = CGSize(width: CGFloat(80), height: CGFloat(80))
            hud.backgroundView.style = .solidColor
            hud.mode = .indeterminate
            hud.contentColor = .black
            hud.removeFromSuperViewOnHide = true
            hud.bezelView.style = .solidColor
            hud.bezelView.backgroundColor = .white
            hud.detailsLabel.text = "loading"
        }
        else
        {
            hud .hide(animated: true)
            hud.removeFromSuperview()
        }
    }

    func ShowNotfication(Status:String,Body:String){
        
      let view = MessageView.viewFromNib(layout: .centeredView)
      view.configureTheme(.success)
      view.iconImageView?.isHidden = true
      view.button?.isHidden = true
      view.backgroundView.backgroundColor = .clear
      view.titleLabel?.textAlignment = .center
      view.bodyLabel?.textAlignment = .center
      view.titleLabel?.isHidden = true
      var BGColor = UIColor()

      if(Status == "Success")
      {
        BGColor = UIColor(red:0.11, green:0.73, blue:0.33, alpha:1.00)
      }else
      {
        BGColor = UIColor(red:0.98, green:0.26, blue:0.18, alpha:1.00)
      }

      view.backgroundColor = BGColor
      view.configureContent(title: Status , body: Body)
      SwiftMessages.show(view: view)
    }
    
    func pushVC(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
