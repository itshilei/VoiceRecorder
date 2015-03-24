//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by hanjing on 24/03/15.
//  Copyright (c) 2015 bluecup. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    var recordedAudio:RecordedAudio!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func viewWillAppear(animated: Bool) {
        //hide the stop button
        stopButton.hidden=true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func RecordAudio(sender: UIButton) {
        //TODO: Show text " Recording in progress"
        recordingInProgress.hidden = false
        
        //show stopButton
        stopButton.hidden=false
        //Record the user's voice
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        
        //add a delegate
        audioRecorder.delegate=self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        println("in recording")
    }
    
    func audioRecorderDidFinishRecording(recorder :AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
            //TODO: save the record audio
            recordedAudio=RecordedAudio()
            recordedAudio.filePathUrl=recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            //TODO: Move to next scene aka proform segue
            self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        
        }else{
            println("record failed")
            //RecordAudio.enabled = true
            stopButton.hidden=false
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "stopRecording"){
            let playsoundVC : PlaySoundsViewController = segue.destinationViewController as PlaySoundsViewController
            let data = sender as RecordedAudio
            playsoundVC.receivedAudio = data
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        recordingInProgress.hidden = true
        
        //stop record
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
}

