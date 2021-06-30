//
//  UserDefaultWrapper.swift
//  PetTrivia
//
//  Created by Pablo Penas on 23/06/21.
//

import Foundation

struct UserInfo: Codable {
//    let username: String
    let guessedRight: [Int]
}

class UserDefaultsWrapper {
    static func setPossibleCategories(categories: [Category]?) {
        let data = try? JSONEncoder().encode(categories)
        UserDefaults.standard.set(data, forKey: "possibleCategories")
    }
    
    static func fetchPossibleCategories() -> [Category]? {
        guard let data = UserDefaults.standard.data(forKey: "possibleCategories") else {
            return nil
        }
        
        let categories = try? JSONDecoder().decode([Category].self, from: data)
        return categories
    }
    
    static func setUserInfo(userInfo: UserInfo) {
        let data = try? JSONEncoder().encode(userInfo)
        UserDefaults.standard.set(data, forKey: "userInfo")
    }
    
    static func fetchUserInfo() -> UserInfo? {
        guard let data = UserDefaults.standard.data(forKey: "userInfo") else {
            return nil
        }
        
        let userInfo = try? JSONDecoder().decode(UserInfo.self, from: data)
        return userInfo
    }
    
    static func clearData(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
