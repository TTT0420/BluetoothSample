//
//  ViewController.swift
//  bluetoothTest
//
//  Created by Taisuke Fujii on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func konashiFind(_ sender: Any) {
        Konashi.find()
    }
    @IBOutlet weak var contents: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        //接続先の非表示
        contents.isHidden = true
        //イベントハンドラーの登録
        Konashi.shared().readyHandler = {
            Konashi.pinMode(KonashiDigitalIOPin.LED2,mode: KonashiPinMode.output)
            //LED5を光らせる
            Konashi.digitalWrite(KonashiDigitalIOPin.LED5, value: KonashiLevel.high)

            if(Konashi.isReady()){

               print("-----------------Konashiとの接続が成功しました。--------------------")

                //接続先の表示
                self.contents.isHidden = false
                //LED2を光らせる
                Konashi.digitalWrite(KonashiDigitalIOPin.LED2, value: KonashiLevel.high)
            }else{
                print("-----------------Konashiとの接続が成功しました。--------------------")
            }

        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

