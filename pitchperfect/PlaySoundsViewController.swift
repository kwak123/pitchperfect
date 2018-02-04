//
//  PlaySoundsViewController.swift
//  pitchperfect
//
//  Created by Samuel Kwak on 2/3/18.
//  Copyright © 2018 Samuel Kwak. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioUrl: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case slow = 0, fast, vader, chipmunk, echo, reverb }
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var lowButton: UIButton!
    @IBOutlet weak var highButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopSound(_ sender: AnyObject) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio();
        
        slowButton.imageView?.contentMode = .scaleAspectFit
        fastButton.imageView?.contentMode = .scaleAspectFit
        lowButton.imageView?.contentMode = .scaleAspectFit
        highButton.imageView?.contentMode = .scaleAspectFit
        echoButton.imageView?.contentMode = .scaleAspectFit
        reverbButton.imageView?.contentMode = .scaleAspectFit
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
