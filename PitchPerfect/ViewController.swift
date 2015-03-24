//
//  ViewController.swift
//  PitchPerfect
//
//  Created by hanjing on 24/03/15.
//  Copyright (c) 2015 bluecup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func RecordAudio(sender: UIButton) {
        //TODO: Show text " Recording in progress"
        
        //Record the user's voice
        println("in recording")
    }
}

