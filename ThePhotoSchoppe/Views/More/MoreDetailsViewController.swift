//
//  MoreDetailsViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import MessageUI

class MoreDetailsViewController: UIViewController {

    @IBOutlet var btnSeeOnTheMap: UIButton!
    @IBOutlet var lblPhoneNumber: UILabel!
    @IBOutlet var lblEmailAddress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
    }
    
    fileprivate func setUpLabels() {
        btnSeeOnTheMap.setImage(#imageLiteral(resourceName: "rightArrow"), for: .normal)
        btnSeeOnTheMap.imageEdgeInsets = UIEdgeInsets(top: 6, left: 140, bottom: 6, right: 14)
        btnSeeOnTheMap.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 34)
        
        let tapPhone = UITapGestureRecognizer(target: self, action: #selector(MoreDetailsViewController.phoneTapped))
        lblPhoneNumber.isUserInteractionEnabled = true
        lblPhoneNumber.addGestureRecognizer(tapPhone)
        
        let tapEmail = UITapGestureRecognizer(target: self, action: #selector(MoreDetailsViewController.emailTapped))
        lblEmailAddress.isUserInteractionEnabled = true
        lblEmailAddress.addGestureRecognizer(tapEmail)
        
        lblPhoneNumber.text = DymmyTexts.ContactPhoneNumber
    }
    
    @objc func phoneTapped(sender:UITapGestureRecognizer) {
        guard let number = URL(string: "tel://" + DymmyTexts.ContactPhoneNumber) else { return }
        UIApplication.shared.open(number)
    }
    
    @objc func emailTapped(sender:UITapGestureRecognizer) {
        sendEmail()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction func btnClickMapView(_ sender: UIButton) {
        performSegue(withIdentifier: NamedSegues.SegueMoreToMap, sender: nil)
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([DymmyTexts.ContactEmailAddress])
            mail.setSubject(DymmyTexts.EmailSubject)
            
            present(mail, animated: true)
        } else {
            print("Fail")
            // show failure alert
        }
    }

}

extension MoreDetailsViewController : MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
