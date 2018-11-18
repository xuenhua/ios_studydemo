//
//  RateViewController.swift
//  studydemo
//
//  Created by Xu Enhua on 2018/11/18.
//  Copyright © 2018 XuEnhua. All rights reserved.
//

import UIKit

class RateViewController: UIViewController {
    var defaultStackViewPostion : CGRect!
    
//组
    @IBOutlet var tapButtons: [UIButton]!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBAction func tapBackground(_ sender: Any) {
        self.dismiss(animated: true) {
            print("tap Back Ground")
        }
    }
    @IBAction func dragStack(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .changed:
            let translation = sender.translation(in: stackView)
            let postion = CGAffineTransform(translationX: translation.x, y: translation.y)
            let angle = sin((translation.x )/(stackView.frame.width))
            
            stackView.transform = postion.rotated(by: angle)
        case .ended:
            UIViewPropertyAnimator(duration: 0.5, dampingRatio: 0.5) {
                self.stackView.transform = .identity
            }.startAnimation()
        default:
            break
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
 
        defaultStackViewPostion=stackView.frame
        // Do any additional setup after loading the view.
//        stackView.transform = .init(translationX: 800, y: 0)
        //进场初始位置
        let startPos = CGAffineTransform(translationX: 50, y: 0)
        //初始大小
        let startScal = CGAffineTransform(scaleX: 3, y: 3)
        for button in tapButtons{
            button.alpha=0
           //button.transform=startPos
            //两个动画组合
            button.transform=startPos.concatenating(startScal)
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
//        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn) {
//            self.stackView.transform = .identity
//        }
//        animator.startAnimation()
        
        UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.tapButtons[0].alpha =  1
            self.tapButtons[0].transform =  .identity
            
        }.startAnimation(afterDelay: 0.1)
        
        UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.tapButtons[1].alpha =  1
            self.tapButtons[1].transform =  .identity
            
            }.startAnimation(afterDelay: 0.2)
        
        UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.tapButtons[2].alpha =  1
            self.tapButtons[2].transform =  .identity
            
            }.startAnimation(afterDelay: 0.3)
        
        UIViewPropertyAnimator(duration: 1, dampingRatio: 0.6) {
            self.tapButtons[3].alpha =  1
            self.tapButtons[3].transform =  .identity
            
            }.startAnimation(afterDelay: 0.4)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
