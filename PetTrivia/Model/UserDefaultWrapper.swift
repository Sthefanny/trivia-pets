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

struct Dog: Codable {
    var dogName: String
    var dogHat: String
}

class UserDefaultsWrapper: ObservableObject {
    
    @Published var dog: Dog
    
    init () {
        dog = UserDefaultsWrapper.fetchDog() ?? (Dog(dogName: "pantufa", dogHat: "strawberry"))
    }
    
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
    
    func setDog(Dog: Dog) {
        self.dog = Dog
        let data = try? JSONEncoder().encode(Dog)
        UserDefaults.standard.set(data, forKey: "customDog")
    }
    
    static func fetchDog() -> Dog? {
        guard let data = UserDefaults.standard.data(forKey: "customDog") else {
            return nil
        }
        let customDog = try? JSONDecoder().decode(Dog.self, from: data)
        return customDog
    }
    
    static func clearData(){
        let domain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: domain)
        UserDefaults.standard.synchronize()
    }
}
