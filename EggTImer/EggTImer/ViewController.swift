//
//  ViewController.swift
//  EggTImer
//
//  Created by CEMTREX on 21/09/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var tittleLable: UILabel!
    @IBOutlet weak var timerSec: UILabel!
    let eggTime = ["Soft":3,"Medium":7,"Hard":12]
    var timeSeconds=0
    var timepassed=0
    var timer: Timer?
    var getReadyTimer: Timer?
    var resetTimer: Timer?
    var player: AVAudioPlayer!
    var eggType: String = ""
    
    var getReadyTime=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetChoice()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func eggTypeSelected(_ sender: Any) {
        resetChoice()
        eggType=(sender as AnyObject).currentTitle!!
        getReadyTimer=Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(getReady), userInfo: nil, repeats: true)
        
    }
    
    @objc func getReady(){
        if getReadyTime>0{
            tittleLable.text="Get Ready in \(getReadyTime) Sec"
            getReadyTime-=1
        }else{
            getReadyTimer?.invalidate()
            timeSeconds=eggTime[eggType]!*60
            tittleLable.text="Let's make some \(eggType) Eggs."
            timer=Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countDownTime), userInfo: nil, repeats: true)
        }
        
    }
    @objc func countDownTime(){
        if timepassed<timeSeconds{
            let percentageProgress=Float(timepassed)/Float(timeSeconds)
            progressBar.setProgress(percentageProgress, animated: true)
            timerSec.text="⏱️ - \(timeSeconds-timepassed) sec"
            timepassed+=1
        }else{
            timer?.invalidate()
            playSound()
            tittleLable.text="\(eggType) Eggs are ready to eat 🥳"
            timerSec.text=""
            resetTimer=Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(resetChoice), userInfo: nil, repeats: true)
        }
    }
    
    @objc func resetChoice(){
        timer?.invalidate()
        getReadyTimer?.invalidate()
        resetTimer?.invalidate()
        timerSec.text=""
        tittleLable.text="How do you like your eggs?"
        timeSeconds=0
        timepassed=0
        getReadyTime=5
        progressBar.setProgress(0.0, animated: true)
    }
    
    func playSound() {
            guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = player else { return }

                player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        }
    
    
}

