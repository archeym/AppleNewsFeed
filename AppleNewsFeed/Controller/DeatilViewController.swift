//
//  DeatilViewController.swift
//  AppleNewsFeed
//
//  Created by Arkadijs Makarenko on 10/05/2023.
//

import UIKit
import CoreData
import SDWebImage

class DeatilViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var descTextView: UITextView!
//#warning("rets item resseved")
    var authorString: String = String()
    var titleString: String = String()
    var webString: String = String()
    var imageString: String = String()
    var descString: String = String()
    
    var savedItems = [Items]()
    var context: NSManagedObjectContext?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = authorString
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        updateDetails()
    }
    
    func updateDetails(){
        titleLabel.text = titleString
        newsImageView.sd_setImage(with: URL(string: imageString))
        descTextView.text = descString
    }
    
    func saveData(){
//#warning("save into core data")
        do {
            try context?.save()
            basicAlert(title: "Saved!", message: "\(titleString) has been saved. Go to Saved Tab Tar Setcion to open it.")
        }catch {
            print(error)
        }
    }
    
    @IBAction func savedButtonTapped(_ sender: Any) {
        
        let newItem = Items(context: self.context!)
        newItem.newsAuthor = authorString
        newItem.newsContent = descString
        newItem.newsTitle = titleString
        newItem.url = webString
        if !imageString.isEmpty {
            newItem.image = imageString
        }
        
        self.savedItems.append(newItem)
        
        saveData()
        
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination: WebViewController = segue.destination as! WebViewController
        destination.urlString = webString
    }
    
    
}
