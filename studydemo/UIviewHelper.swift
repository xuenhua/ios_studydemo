//
//  UIviewHelper.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/10/21.
//  Copyright © 2018年 XuEnhua. All rights reserved.
//

import UIKit

extension UIView{
    @IBInspectable
    var cornerRadius:CGFloat{
        get{
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius=newValue
        }
    }
    
    @IBInspectable
    var shadowRadius:CGFloat{
        get{
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius=newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity:Float{
        get{
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity=newValue
        }
    }
    
    @IBInspectable
    var shadowColor:UIColor?{
        get{
            return layer.shadowColor != nil ? UIColor(cgColor: layer.shadowColor!):nil
        }
        set {
            layer.shadowColor=newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowOffset:CGSize{
        get{
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset=newValue
        }
    }
}
