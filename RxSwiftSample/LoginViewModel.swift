//
//  LoginViewModel.swift
//  RxSwiftSample
//
//  Created by Nikita Kuprik on 6/24/19.
//  Copyright © 2019 Nikita Kuprik. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

struct LoginViewModel {
    var emailText = BehaviorRelay<String>(value: "")
    var passwordText = BehaviorRelay<String>(value: "")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { email, password in
            email.count >= 3 && password.count >= 3
        }
    }
}
