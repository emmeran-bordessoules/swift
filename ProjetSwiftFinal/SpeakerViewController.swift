//
//  SpeakerViewController.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 16/03/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit

// La classe SpeakerViewController permet d'afficher le speaker correpondant à une activité

class SpeakerViewController: UIViewController {
    
    var speaker: Speaker?

    @IBOutlet weak var labelSpeaker: UILabel!
    @IBOutlet weak var nomSpeaker: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nomSpeaker.text = speaker?.nameSpeaker
        self.labelSpeaker.text = speaker?.details

        // Charge et affiche le nom et description du speaker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
