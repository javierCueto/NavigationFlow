//
//  LoginSession.swift
//  NavigationFlow
//
//  Created by Javier Cueto on 18/12/23.
//

import Foundation

protocol LoginSession {
    func login()
    func logout()
    var isLogged: Bool { get }
}

struct LoginSessionImp: LoginSession {
    let userDefault = UserDefaults.standard
    let loginKey = "login_key"
    
    func login() {
        userDefault.setValue(true, forKey: loginKey)
    }
    
    func logout() {
        userDefault.setValue(false, forKey: loginKey)
    }
    
    var isLogged: Bool {
        userDefault.object(forKey: loginKey) as? Bool ?? false
    }
}
