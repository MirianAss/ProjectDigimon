//
//  Request.swift
//  ProjectDigimon
//
//  Created by Mirian Santana on 29/03/23.
//

import UIKit
import Alamofire

protocol RequestDelegate: NSObject {
    func finishProtocol(arrayDeDigimon: Digimon?)
}

class Request: NSObject {
    var arrayDigimon: Digimon?
    weak var delegate: RequestDelegate?
    
    func requestDigimon(completion: @escaping (Digimon?) -> Void) {
        AF.request("https://digimon-api.vercel.app/api/digimon").response { response in
            
            let digimon = try? JSONDecoder().decode(Digimon.self, from: response.data ?? Data())
            
            self.arrayDigimon = digimon
            completion(digimon)
            self.delegate?.finishProtocol(arrayDeDigimon: digimon)
        }
    }
}
