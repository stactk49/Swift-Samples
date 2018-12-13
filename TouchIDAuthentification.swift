//
//  TouchIDAuthentification.swift
//  DHMyHome
//
//  Created by tstachowski on 8/22/17.
//  Copyright © 2017 Jak Jonnalagadda. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

class touchIDAuth {
    let context:LAContext = LAContext()
    
    func authenticateUser(completion: @escaping (String?) -> Void) {
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Touch the Home button to unlock", reply: {
                (wasSuccessful, error) in
                if wasSuccessful {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                    print("By the time we get to the future it will already have happened.")
                }
                else {
                    if let evaluateError = error as NSError? {
                        let message = self.errorMessageForLAErrorCode(errorCode:evaluateError.code)
                        if(evaluateError.code == LAError.userCancel.rawValue || evaluateError.code == LAError.userFallback.rawValue) {
                            DispatchQueue.main.async {
                                completion("cancel")
                            }
                        }
                        else {
                            DispatchQueue.main.async {
                                completion(message)
                            }
                        }
                    }
                }
            })
        }
        else {
            let message = self.errorMessageForLAErrorCode(errorCode: LAError.touchIDNotAvailable.rawValue)
            DispatchQueue.main.async {
                completion(message)
            }
        }
    }
    
    func errorMessageForLAErrorCode(errorCode: Int) -> String {
        var message = ""
        switch errorCode {
        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts"
        case LAError.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"
        default:
            message = "Something happened"
        }
        return message
    }
    
}


