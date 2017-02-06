//
//  secondViewController.swift
//  sampleMiniGuidebook
//
//  Created by Eriko Ichinohe on 2017/02/06.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    //リストから選ばれた名前が格納される
    var scSelectedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(scSelectedName)
        
        // AppDelegateにアクセスするための準備
        let myApp = UIApplication.shared.delegate as! AppDelegate
        
        for(key,data) in myApp.dicPlaceList {
            
            //TODO:選択された土地名と同じデータを検出し、ガイドの詳細ページを作成しましょう
            //ヒント:地図がうまく出ない場合、座標の数値を確認しましょう
            //ヒント:atofを使って文字から小数点の形に座標を変換しましょう
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
