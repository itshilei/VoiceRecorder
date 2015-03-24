//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by hanjing on 24/03/15.
//  Copyright (c) 2015 bluecup. All rights reserved.
//

import UIKit
import AVFoundation


class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    //var audioRecorder:AVAudioRecorder!
    var receivedAudio:RecordedAudio!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        /*if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            
            //convert string to NSURL
            var filePathNSURL = NSURL.fileURLWithPath(filePath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathNSURL, error: nil)
            audioPlayer.enableRate = true
        }
        else{
            println("the filepath is empty")
        }
        */
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
        //play slow audio
        audioPlayer.stop()
        audioPlayer.currentTime=0.0
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }

    @IBAction func stopAudioPlayer(sender: UIButton) {
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
