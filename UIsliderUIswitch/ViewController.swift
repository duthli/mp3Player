//
//  ViewController.swift
//  UIsliderUIswitch
//
//  Created by do duy hung on 17/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var btn_play: UIButton!
    
    @IBOutlet weak var Slider: UISlider!
    
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var cur_time: UILabel!
    
    @IBOutlet weak var slider_time: UISlider!
    
    
    var au = AVAudioPlayer()
    var p : Bool = false
    
    
    @IBAction func sl_volume(sender: UISlider) {
        print(sender.value)
        au.volume = sender.value
        setthumb()
    }
    
    
    @IBAction func action_play(sender: AnyObject) {
        if (p == true){
            pause()
        }
        else {
        play()
        }
    }
    
    
    func play(){
        au.play()
        p = true
        btn_play.setBackgroundImage(UIImage(named: "pause.png"), forState: .Normal)
    }
    
    
    func pause(){
        au.pause()
        p = false
        btn_play.setBackgroundImage(UIImage(named: "play.png"), forState: .Normal)
    }
    
    
    func setthumb(){
        Slider.setThumbImage(UIImage(named: "thumb.png"), forState: .Normal)
        Slider.setThumbImage(UIImage(named: "thumbHightLight.png"), forState: .Highlighted)
        slider_time.setThumbImage(UIImage(named: "duration.png"),forState: .Normal)

    
    }
    var x:Float = 0
    @IBAction func sli_time(sender: UISlider) {
        au.currentTime = au.duration * Double(sender.value)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        au = try! AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("music", ofType: ".mp3")!))
        // Do any additional setup after loading the view, typically from a nib.
        au.prepareToPlay()
        let Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector (updateTimerLeft), userInfo: nil, repeats: true)
//        cur_time.text = String(format: "%2.2f",au.currentTime/60)
//        slider_time.value = Float(au.currentTime / au.duration)
//        Time.text = String(format: "%2.2f",au.duration/60)
                slider_time.setThumbImage(UIImage(named: "duration.png"),forState: .Normal)
        au.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func updateTimerLeft(){
        cur_time.text = String(format: "%2.2f",au.currentTime/60)
        slider_time.value = Float(au.currentTime / au.duration)
        Time.text = String(format: "%2.2f",au.duration/60)
    }
    
    var reMu : Bool = false
    @IBAction func switchOf(sender: UISwitch) {
        if(sender.on == false){
            reMu = false
        }
        if (sender.on == true){
            reMu = true
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer, successfully flag: Bool) {
        if (reMu == true){
            print(reMu)
            play()
        }
        if (reMu == false){
            print ("ket thuc")
            pause()
            print(reMu)
        }
    }
}
