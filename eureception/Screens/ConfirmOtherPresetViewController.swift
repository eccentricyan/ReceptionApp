//
//  ConfirmOtherPresetViewController.swift
//  eureception
//
//  Created by Hiroshi Kimura on 9/2/15.
//  Copyright © 2015 eureka. All rights reserved.
//

import Foundation
import UIKit

class ConfirmOtherPresetViewController: BaseConfirmViewController {
    
    var transaction: OtherTransaction?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.iconImageView.tintColor = UIColor.eureColor
        self.messageEnLabel.attributedText = NSAttributedString(string: "Ready to send?", attributes: [
            NSKernAttributeName : NSNumber(integer: 3),
            NSFontAttributeName : UIFont.eureBoldFont(size: 33),
            NSForegroundColorAttributeName : UIColor.eureColor,
            ]
        )
        self.messageJaLabel.attributedText = NSAttributedString(string: "担当者へ連絡します\nよろしいですか？", attributes: [
            NSKernAttributeName : NSNumber(integer: 3),
            NSFontAttributeName : UIFont.eureBoldFont(size: 21),
            NSForegroundColorAttributeName : UIColor.eureColor,
            ]
        )
    }
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var messageEnLabel: UILabel!
    @IBOutlet weak var messageJaLabel: UILabel!
    
    override dynamic func handleSubmitButton(sender: AnyObject) {
        
        let controller = CompletionViewController.viewControllerFromStoryboard()
        
        guard let transaction = self.transaction else {
            return
        }
        
        Container.VisitorsModel.sendVisitor(transaction: transaction) { (result) -> Void in
            
        }
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}