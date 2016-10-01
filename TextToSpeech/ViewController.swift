//
//  ViewController.swift
//  TextToSpeech
//
//  Created by imagepit on 2016/10/01.
//  Copyright © 2016年 imagepit. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initView(){
        label.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20)
        label.center = self.view.center
        label.text = " I have a pen."
        self.view.addSubview(label)
        
        button.frame = CGRect(x: 0, y: 0, width: 300, height: 30)
        button.center = CGPoint(x: self.view.center.x, y: self.view.center.y+30)
        button.backgroundColor = UIColor.red
        button.titleLabel?.textColor = UIColor.white
        button.setTitle("テキスト読み上げ", for: .normal)
        button.addTarget(self, action: #selector(ViewController.speech), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func speech(){
        let speechSynthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: self.label.text!)
        let voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.voice = voice
        speechSynthesizer.speak(utterance)
    }
}

