//
//  DeatilViewController.swift
//  AppleNewsFeed
//
//  Created by Arkadijs Makarenko on 10/05/2023.
//

import UIKit
import CoreData


class DeatilViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var titleString: String = String()
    var webString: String = String()
    
#warning("rets item resseved")
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Author name"
        titleLabel.text = titleString
        
    }
    
    func saveData(){
#warning("save into core data")
    }
    
    @IBAction func savedButtonTapped(_ sender: Any) {
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination: WebViewController = segue.destination as! WebViewController
        destination.urlString = webString
    }
    
    
}
