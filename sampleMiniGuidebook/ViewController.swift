//
//  ViewController.swift
//  sampleMiniGuidebook
//
//  Created by Eriko Ichinohe on 2017/02/03.
//  Copyright © 2017年 Eriko Ichinohe. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var placeListTableView: UITableView!
    var placeList:[NSString] = []
    
    //選択された土地名が格納される変数
    var selectedName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ファイルパスを取得
        let filePath = Bundle.main.path(forResource: "placelist", ofType: "plist")
        
        //ファイルの内容を読み込んでディクショナリー型に代入
        // AppDelegateにアクセスするための準備
        let myApp = UIApplication.shared.delegate as! AppDelegate
        
        
//        let dic = NSDictionary(contentsOfFile: filePath!)
        myApp.dicPlaceList = NSDictionary(contentsOfFile: filePath!)!
        
        //TableViewで扱いやすい形（エリア名の入ってる配列）を作成
        for(key,data) in myApp.dicPlaceList {
            print(key)
            placeList.append(key as! NSString)
        }
        
        // TODO:placeListを使ってTableViewにスポット名を表示しましょう
        // placeListには5件以上スポット情報を作成しましょう
        
    }
    
    //行数決定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }
    
    //表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = placeList[indexPath.row] as String
        
        cell.textLabel?.textColor = UIColor.purple
        
        return cell

    }
    
    //行を選択したときに行う処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //選択された行に表示された名前を格納
        selectedName = placeList[indexPath.row] as String
        
        //セグエを使って画面移動
        performSegue(withIdentifier: "showSecondView", sender: nil)
    }
    
    // Segueで画面遷移するとき
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! secondViewController
        
        //次の画面に選択された土地名を渡す
        secondVC.scSelectedName = selectedName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

