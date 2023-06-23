//
//  imageVC.swift
//  PicQuestApp
//
//  Created by Priyadarsini, Anjali (Contractor) on 21/06/23.
//

import UIKit

var picImage = Utility()
var image: [picInfo] = []

class ImageVC: UIViewController {
    
    @IBOutlet weak var enteredT: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var imageView: picInfo?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageView = imageView{
            titleLabel.text = imageView.title
            
            Utility.shared.picLoading(server: imageView.server, id: imageView.id, secret: imageView.secret) { imageUrl in
                let imgData = try! Data(contentsOf: imageUrl)
                
                self.photoView.image = UIImage(data: imgData)
            }
        }
        
        
    }
    
  
    @IBAction func shareClick(_ sender: Any) {
        print("Clicked -------")
        guard let image = photoView.image else{
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        
    }
}
