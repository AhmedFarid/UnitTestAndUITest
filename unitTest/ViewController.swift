//
//  ViewController.swift
//  unitTest
//
//  Created by macbook on 13/06/2022.
//

import UIKit

class TipCalc {
  var defPerc = 75.0
  
  func calcTip(amount: Double, tipPerc: Double) -> Double {
    return amount * tipPerc/100.0
  }
}

class Music {
  var cache: [[String:Any]]?
  var fetchData: Data?
  
  func refresh() {
    cache = nil
    fetchData = nil
    fetchMusic {(newData,error) in
      if newData != nil {
        self.fetchData = Data()
      }
    }
  }
  
  func fetchMusic(completion: @escaping ([[String:Any]]?,Error?)-> Void) {
    guard cache == nil else {completion(cache, nil); return}
    let dt = URLSession.shared.dataTask(with: URL.init(string: "https://orangevalleycaa.org/api/music")!) { (data,response,error) in
      completion(self.parseJson(data: data!), error)
    }
    dt.resume()
  }
  
  func parseJson(data: Data)-> [[String:Any]]? {
    cache = try? JSONSerialization.jsonObject(with: data,options: [])as? [[String:Any]]
    return cache
  }
  
}

class ViewController: UIViewController {

  @IBOutlet weak var btnCalc: UIButton!
  @IBOutlet weak var lbOutPut: UILabel!
  @IBOutlet weak var tfInput: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  
  
  @IBAction func doBtnCalc(_ sender: Any) {
    if let val = Double.init(tfInput.text!) {
      let tc = TipCalc()
      let tip = tc.calcTip(amount: val, tipPerc: 50.0)
      lbOutPut.text = "tip: \(tip)"
    }
  }
  
}

