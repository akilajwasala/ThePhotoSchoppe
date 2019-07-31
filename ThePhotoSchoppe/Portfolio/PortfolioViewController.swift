//
//  PortfolioViewController.swift
//  ThePhotoSchoppe
//
//  Created by Akila J Wasala on 7/30/19.
//  Copyright © 2019 AkilaJWasala. All rights reserved.
//

import UIKit
import MessageUI

class PortfolioViewController: UIViewController {
    
    private var viewModel = PortfolioViewModel()
    private var imageItems = [ImageItem]()
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
//        imageItems.append(ImageItem(date: "24 Jun 2019", link: "", image: #imageLiteral(resourceName: "backgroundImage")))
        
        viewModel.getPortfolio(callback: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if let fullImageVC = segue.destination as? FullImageViewController {
            fullImageVC.selectedItem = sender as? ImageItem
            fullImageVC.emailButtonClickClosure = { item in
                self.sendEmail(item: item)
            }
            fullImageVC.webSiteButtonClickClosure = { () in
                self.performSegue(withIdentifier: NamedSegues.SeguePortfolioToWebView, sender: nil)
            }
        }
    }
    
    fileprivate func sendEmail(item: ImageItem) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
//            if let imageData = item.uiimage?.jpegData(compressionQuality: 0.5) {
//                mail.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: item.date_taken!)
//                present(mail, animated: true)
//            }
        } else {
            print("Fail")
        }
    }
}

extension PortfolioViewController : MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}


extension PortfolioViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.ImageCollectionViewCell, for: indexPath as IndexPath) as! ImageCollectionViewCell
        cell.setObject(item: imageItems[indexPath.row])
        return cell
    }
    
}

extension PortfolioViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: NamedSegues.SeguePortfolioToFullImage, sender: imageItems[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.row
    }
}

extension PortfolioViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: 350)
    }
}

extension PortfolioViewController : UIGetPortfolioDelegate {
    
    func onGetPortfolioSuccess(items: [ImageItem]) {
        imageItems = items
        pageControl.numberOfPages = imageItems.count

        print(items.count)
    }
    
    func onGetPortfolioFailed(reason: String) {
        print(reason)
    }
    
}
