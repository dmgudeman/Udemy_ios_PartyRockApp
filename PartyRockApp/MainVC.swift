//
//  ViewController.swift
//  PartyRockApp
//
//  Created by David Gudeman on 8/11/17.
//  Copyright © 2017 dmgudeman. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var partyRocks = [PartyRock]()

  override func viewDidLoad() {
      super.viewDidLoad()
    let p1 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/c_3xZgvy6fo\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "New Thang")
    
    let p2 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lets Get Ridiculous")
    let p3 = PartyRock(imageURL: "http://www.wavefm.com.au/images/stories/2015/04/redfoo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/tWyuglGCKgE\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle")
    let p4 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/NDnW_9JLfig\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Sock It To Ya")
    let p5 = PartyRock(imageURL: "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/UA8rcLvS1BY\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Champagne Showers")
    
    partyRocks.append(p1)
    partyRocks.append(p2)
    partyRocks.append(p3)
    partyRocks.append(p4)
    partyRocks.append(p5)
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
      let partyRock = partyRocks[indexPath.row]
        cell.updateUI(partyRock: partyRock)
    
      return cell
    } else {
         return UITableViewCell()
    }
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return partyRocks.count
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let partyRock = partyRocks[indexPath.row]
    
    performSegue(withIdentifier: "VideoVC", sender: partyRock)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? VideoVC {
      if let party = sender as? PartyRock {
        destination.partyRock = party
      }
    }
  }

}

