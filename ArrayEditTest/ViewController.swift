//
//  ViewController.swift
//  ArrayEditTest
//
//  Created by Ryohei Nanano on 2018/05/02.
//  Copyright © 2018年 GeekSalon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //==========以下、テスト関数==========
    
    ///『map』→ 配列内の全要素に処理を適用し、その処理を施した配列を使いたい場合に使用
    func mapTest()
    {
        let hogeArray = [1, 2, 3, 4, 5]
        let mappedArray = hogeArray.map{ $0 * 5 }//hogeArrayの各要素を5倍→結果を変数newArrayに格納
        print(mappedArray)
    }
    
    //摂氏を華氏に変換する関数
    func mapTest2()
    {
        let celsius = ["Tokyo":14.0, "Osaka":17.0, "Okinawa":26.0]//辞書型で宣言
        let fahrenheit = celsius.map { ($0.0, 1.8 * $0.1 + 32) } // [("Okinawa", 78.8), ("Tokyo", 57.2), ("Osaka", 62.6)]
        //$0.0でkeyを、$0.1でvalueを示している！
        
        let hoge = celsius.map{($0.0 + "Hoge", $0.1 + 2)}
        //Dictionaryの時 → $0.0でkeyを、$0.1でvalueを示している！
        
        print(hoge)
    }
    //返り値が無い時はforEachを使うのが望ましい。(mapで返り値ないとwarning出るから)
    //mapの返り値voidにしちゃえばまあ使えるけどね！
    
    
    ///『filter』→ 条件にマッチする要素のみを取り出したい場合に使用
    func filterTest()
    {
        let hogeArray = [1, 2, 3, 4, 5]
        let filteredArray = hogeArray.filter { $0 < 4 }//各要素に対してその要素が4より小さいかどうかを判断 → 条件満たすものだけ変数filteredArrayに格納
        print(filteredArray)
    }
    
    //摂氏を華氏に変換 → さらにfilterで条件絞り込み
    func filterTest2()
    {
        let celsius = ["Tokyo":14.0, "Osaka":17.0, "Okinawa":26.0]
        let fahrenheit =
            celsius.map { ($0.0, 1.8 * $0.1 + 32) } //mapで配列celsius内の全要素に対して処理
                .filter { $0.1 > 60 } //$0.1(value)の値でfilterかける
                .map { $0.0 } //$0.0(key)の値だけ取り出す
        
        print(fahrenheit)
    }
    
    ///『reduce』→ 要素使って結果を集計したいような場合に使用
    func reduceTest()
    {
        let hogeArray = [1,2,3,4,5]
        let initialValue = 1//配列内の要素を結合させる時の初期値！
        ///resultNum → 足した結果(小計)
        ///num → 次に足す数
        let reducedValue = hogeArray.reduce(initialValue) { (resultNum, num) -> Int in//配列内の全要素を掛け算 → その結果を変数reducedValueに格納
            return resultNum * num//計算結果を返す
        }
        print(reducedValue)
    }
    
    func reduceTest2()
    {
        let hogeArray = [1,2,3,4,5]
        let reducedValue: Int = hogeArray.reduce(0) { (resultNum, num) -> Int in//返り値はInt型！
            resultNum + num * num
        }
        print(reducedValue)
    }
    
    //reduceTest2と同じ処理をこういう書き方もできる！
    func reduceTest3()
    {
        let hogeArray = [1,2,3,4,5]
        let reducedValue = hogeArray.reduce(0) { $0 + $1 * $1 }
        print(reducedValue)
    }

}

