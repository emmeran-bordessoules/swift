//
//  CateringDetail.swift
//  ProjetSwiftFinal
//
//  Created by LaCoherence on 13/04/2016.
//  Copyright © 2016 LaCoherence. All rights reserved.
//

import UIKit

class CateringDetail: UIViewController {

    @IBOutlet weak var restName: UILabel!
    var restaurant: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.restName.text = restaurant
        
        // Charge et affiche le nom et description du speaker
    }
    
    
}
