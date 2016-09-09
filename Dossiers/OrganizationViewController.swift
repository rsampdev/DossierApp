//
//  ViewController.swift
//  Dossiers
//
//  Created by Rodney Sampson on 9/8/16.
//  Copyright © 2016 Rodney Sampson II. All rights reserved.
//

import UIKit

class OrganizationViewController: UIViewController {
    
    var organization: Organization?
    var operatives: [Dossier]?
    
    @IBOutlet var firstDossierButton: UIButton!
    @IBOutlet var secondDossierButton: UIButton!
    @IBOutlet var thirdDossierButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operatives = [Dossier]()
        operatives?.append(Dossier.init(name: "Agent Fizz", lastKnownLocation: "The Iron Yard", knownAssociates: ["Buzz", "FizzBuzz"], occupation: "Dossier", languagesSpoken: ["English"]))
        
        operatives?.append(Dossier.init(name: "Agent Buzz", lastKnownLocation: "The Iron Yard", knownAssociates: ["Fizz", "FizzBuzz"], occupation: "Dossier", languagesSpoken: ["English"]))
        
        operatives?.append(Dossier.init(name: "Agent FizzBuzz", lastKnownLocation: "The Iron Yard", knownAssociates: ["Fizz", "Buzz"], occupation: "Dossier", languagesSpoken: ["English"]))
        
        organization = Organization.init(name: "Org.org", operatives: operatives!)
        
        title = organization?.name
        
        firstDossierButton?.setTitle(operatives?[0].name, for: UIControlState.normal)
        secondDossierButton?.setTitle(operatives?[1].name, for: UIControlState.normal)
        thirdDossierButton?.setTitle(operatives?[2].name, for: UIControlState.normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DossierViewController
        var tempDossier: Dossier
        var tempDossierIndex: Int
        
        if firstDossierButton.isSelected {
            tempDossier = (organization?.operatives[0])!
            buttonTapped(button: firstDossierButton)
            tempDossierIndex = 0
        } else if secondDossierButton.isSelected {
            tempDossier = (organization?.operatives[1])!
            buttonTapped(button: secondDossierButton)
            tempDossierIndex = 1
        } else if thirdDossierButton.isSelected {
            tempDossier = (organization?.operatives[2])!
            buttonTapped(button: thirdDossierButton)
            tempDossierIndex = 2
        } else {
            fatalError("This should never happen. Ever")
        }
        
        destination.dossier = tempDossier
        destination.dossierIndex = tempDossierIndex
    }
    
    @IBAction private func buttonTapped(button: UIButton) {
        button.isSelected = !button.isSelected
    }
    
}
