//
//  MockMusic.swift
//  unitTestTests
//
//  Created by macbook on 14/06/2022.
//

import Foundation
@testable import unitTest

class MockMusic: Music {
  
  override func fetchMusic(completion: @escaping ([[String : Any]]?, Error?) -> Void) {
    let bundle = Bundle(for: type(of: self))
    if let path = bundle.path(forResource: "JSON", ofType: "txt") {
      if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
        let parsedData = self.parseJson(data: data)
        completion(parsedData,nil)
      }
    }
  }
}
