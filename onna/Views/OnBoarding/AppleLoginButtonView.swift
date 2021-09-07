//
//  AppleLoginButtonView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 07/09/21.
//

import SwiftUI
import CloudKit
import AuthenticationServices

struct AppleLoginButtonView : View {
    
    @State var login: Bool
    
    var body: some View {
        
        SignInWithAppleButton(
            // Request User FullName and Email
            onRequest: { request in
                // You can change them if needed.
                request.requestedScopes = [.fullName, .email]
            },
            // Once user complete, get result
            onCompletion: { result in
                // Switch result
                switch result {
                    // Auth Success
                    case .success(let authResults):

                    switch authResults.credential {
                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                            let userID = appleIDCredential.user
                            if let firstName = appleIDCredential.fullName?.givenName,
                                let lastName = appleIDCredential.fullName?.familyName,
                                let email = appleIDCredential.email{
                                // For New user to signup, and
                                // save the 3 records to CloudKit
                                let record = CKRecord(recordType: "UsersData", recordID: CKRecord.ID(recordName: userID))
                                record["email"] = email
                                record["firstName"] = firstName
                                record["lastName"] = lastName
                                // Save to local
                                UserDefaults.standard.set(email, forKey: "email")
                                UserDefaults.standard.set(firstName, forKey: "firstName")
                                UserDefaults.standard.set(lastName, forKey: "lastName")
                                let publicDatabase = CKContainer.default().publicCloudDatabase
                                publicDatabase.save(record) { (_, _) in
                                    UserDefaults.standard.set(record.recordID.recordName, forKey: "userID")
                                }
                                // Change login state
                                self.login = true
                            } else {
                                // For returning user to signin,
                                // fetch the saved records from Cloudkit
                                let publicDatabase = CKContainer.default().publicCloudDatabase
                                publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userID)) { (record, error) in
                                    if let fetchedInfo = record {
                                        let email = fetchedInfo["email"] as? String
                                        let firstName = fetchedInfo["firstName"] as? String
                                        let lastName = fetchedInfo["lastName"] as? String
                                        // Save to local
                                        UserDefaults.standard.set(userID, forKey: "userID")
                                        UserDefaults.standard.set(email, forKey: "email")
                                        UserDefaults.standard.set(firstName, forKey: "firstName")
                                        UserDefaults.standard.set(lastName, forKey: "lastName")
                                        // Change login state
                                        self.login = true
                                    }
                                }
                            }

                        // default break (don't remove)
                        default:
                            break
                        }
                    case .failure(let error):
                        print("failure", error)
                }
            }
        )
        .signInWithAppleButtonStyle(.black) // Button Style
        .frame(width:350,height:50)
        
    }
}
