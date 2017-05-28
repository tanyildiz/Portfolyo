//
//  ViewController.swift
//  Portfolyo
//
//  Created by Niyazi TANYILDIZ on 29/05/2017.
//  Copyright © 2017 nt. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var workNames = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let urlStr = "http://www.tanyildiz.com/?json=1"
        let url = URL(string: urlStr)
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            
            if error != nil
            {
                print(error!)
            } else
            {
                do
                {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    
                    if let posts = json?.value(forKeyPath: "posts.title") as? NSArray
                    {
                        for i in 0..<posts.count
                        {
                            self.workNames.append(posts[i] as! String)
                        }
                    }
                    print(self.workNames)
                }
                catch
                {
                    print(error)
                }
            }
        }; task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return workNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sampleCell", for: indexPath) as! SampleTableViewCell
        cell.workName.text = workNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

}

