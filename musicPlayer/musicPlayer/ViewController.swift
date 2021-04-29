//
//  ViewController.swift
//  musicPlayer
//
//  Created by Ajay Sharma on 27/04/21.
//  Copyright © 2021 Ajay Sharma. All rights reserved.
//

import UIKit

protocol musicDataDelegate  {
    func musicData()
   }


class ViewController: UIViewController , UITableViewDelegate   {
   
    
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var searchPressed: UIButton!
    
    @IBOutlet weak var track1: UILabel!
    
    @IBOutlet weak var artist1: UILabel!
   
    @IBOutlet weak var track2: UILabel!
    
    @IBOutlet weak var artist2: UILabel!
    @IBOutlet weak var track3: UILabel!
    @IBOutlet weak var artist3: UILabel!
    @IBOutlet weak var track4: UILabel!
    @IBOutlet weak var artist4: UILabel!
    
    @IBOutlet weak var track5: UILabel!
    
    @IBOutlet weak var artist5: UILabel!
    
    
    
    
    var inputTerm = String()
    var APIUrl = "https://itunes.apple.com/search?term="
    
    var finalUrl = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTextField.layer.cornerRadius = 20
        searchTextField.delegate = self
    }
    
}
 
extension ViewController: UITextFieldDelegate {
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            inputTerm = textField.text ?? ""
            finalUrl = "\(APIUrl)\(inputTerm)"
           
            performRequest(urlString:finalUrl)
            return true
            
        } else {
            textField.placeholder = "Search for a song "
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTextField.text = ""
       
        
 }
  func performRequest(urlString: String) {
        if let url = URL(string: finalUrl){
            let session = URLSession(configuration:.default)
            let task = session.dataTask(with: url) { (data, response , error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data{
                    self.parseJSON(finalUrl: safeData)
                }
                
            }
            task.resume()
            
        }
    }
    func parseJSON(finalUrl: Data) {
        let decoder = JSONDecoder()
        do {
        let  decodedData = try decoder.decode(musicData.self, from: finalUrl)
            DispatchQueue.main.async { // Correct
                self.track1.text = "1. " + decodedData.results[0].trackName
            self.artist1.text =   decodedData.results[0].artistName
                
                self.track2.text = "2. " + decodedData.results[1].trackName
                self.artist2.text = "   "+decodedData.results[1].artistName
                
                self.track3.text =  "3. " + decodedData.results[2].trackName
                self.artist3.text = "   "+decodedData.results[2].artistName
                
                self.track4.text = "4. " + decodedData.results[3].trackName
                self.artist4.text = "   "+decodedData.results[3].artistName
                
                self.track5.text = "5. " + decodedData.results[4].trackName
                self.artist5.text = "   "+decodedData.results[4].artistName
                
            }
        
           
   }
            
        catch {
            print(error)
        }
       
    }
  
}

