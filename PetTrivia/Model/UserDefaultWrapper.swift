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
    static func setLastSortedCategory(sorted: Int) {
        UserDefaults.standard.set(sorted, forKey: "lastSortedCategory")
    }
    
    static func fetchLastSortedCategory() -> Int? {
        return UserDefaults.standard.integer(forKey: "lastSortedCategory")
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
