//
//  CacheDate.swift
//  TestProject
//
//  Created by Kazakov Danil on 27.10.2022.
//

import Foundation


final class UserDefaultsService {
    
    static let shared = UserDefaultsService()
    
    private init () {}
    
    enum UserDefaultKeys {
        static let saveDate = "saveDate"
        static let companyData = "companyData"
    }
    
    private let storage = UserDefaults.standard
    
    var saveDate: Date {
        get {
            return storage.object(forKey: UserDefaultKeys.saveDate) as? Date ?? Date.distantPast
        }
        set {
            storage.set(newValue, forKey: UserDefaultKeys.saveDate)
        }
    }
    
    var companyData: Data {
        get {
            return storage.data(forKey: UserDefaultKeys.companyData) ?? .init()
        }
        set {
            storage.set(newValue, forKey: UserDefaultKeys.companyData)
        }
    }
    
}
