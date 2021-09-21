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
    
    @State var action: () -> Void
    @ObservedObject var viewModel = UserViewModel()
    @State private var showErrorAlert: Bool = false
    
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
                        let userId = appleIDCredential.user
                        if var firstName = appleIDCredential.fullName?.givenName,
                           let lastName = appleIDCredential.fullName?.familyName,
                           let email = appleIDCredential.email{
                            
                            if let data = UserDefaults.standard.string(forKey: UserDefaultsKeys.nickName.name) {
                                firstName = data
                            }
                            
                            // For New user to signup, and
                            // save the 3 records to CloudKit
                            let record = CKRecord(recordType: "UsersData", recordID: CKRecord.ID(recordName: userId))
                            record[UserDefaultsKeys.email.name] = email
                            record[UserDefaultsKeys.firstName.name] = firstName
                            record[UserDefaultsKeys.lastName.name] = lastName
                            
                            // Save to local
                            UserDefaults.standard.set(email, forKey: UserDefaultsKeys.email.name)
                            UserDefaults.standard.set(firstName, forKey: UserDefaultsKeys.firstName.name)
                            UserDefaults.standard.set(lastName, forKey: UserDefaultsKeys.lastName.name)
                            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLogged.name)
                            let publicDatabase = CKContainer.default().publicCloudDatabase
                            publicDatabase.save(record) { (_, _) in
                                UserDefaults.standard.set(record.recordID.recordName, forKey: UserDefaultsKeys.userId.name)
                            }
                            
                            //Create user in API
                            
                            viewModel.user = User(image: getRandomProfileImage(), firstName: firstName, lastName: lastName, email: email, password: userId, birthDate: nil, insta: nil, phrase: nil, deviceId: "", version: "1.0.0", so: "iOS", token: nil)
                            viewModel.createAndLoginUser { isLogged in
                                // Change login state
                                if (isLogged){
                                    UserDefaults.standard.set(viewModel.user?.token?.accessToken, forKey: UserDefaultsKeys.accessToken.name)
                                    self.action()
                                } else {
                                    showErrorAlert = true
                                }
                            }
                        } else {
                            // For returning user to signin,
                            // fetch the saved records from Cloudkit
                            let publicDatabase = CKContainer.default().publicCloudDatabase
                            publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userId)) { (record, error) in
                                if let fetchedInfo = record {
                                    let email = fetchedInfo[UserDefaultsKeys.email.name] as? String
                                    var firstName = fetchedInfo[UserDefaultsKeys.firstName.name] as? String
                                    let lastName = fetchedInfo[UserDefaultsKeys.lastName.name] as? String
                                    
                                    if let data = UserDefaults.standard.string(forKey: UserDefaultsKeys.nickName.name) {
                                        firstName = data
                                    }
                                    
                                    // Save to local
                                    UserDefaults.standard.set(userId, forKey: UserDefaultsKeys.userId.name)
                                    UserDefaults.standard.set(email, forKey: UserDefaultsKeys.email.name)
                                    UserDefaults.standard.set(firstName, forKey: UserDefaultsKeys.firstName.name)
                                    UserDefaults.standard.set(lastName, forKey: UserDefaultsKeys.lastName.name)
                                    UserDefaults.standard.set(true, forKey: UserDefaultsKeys.isLogged.name)
                                    
                                    //Login user in API
                                    DispatchQueue.main.async {
                                        viewModel.user = User(image: getRandomProfileImage(), firstName: nil, lastName: nil, email: email!, password: userId, birthDate: nil, insta: nil, phrase: nil, deviceId: nil, version: nil, so: nil, token: nil)
                                        viewModel.loginUser { isLogged in
                                            // Change login state
                                            if (isLogged){
                                                UserDefaults.standard.set(viewModel.user?.token?.accessToken, forKey: UserDefaultsKeys.accessToken.name)
                                                self.action()
                                            } else {
                                                showErrorAlert = true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        
                    // default break (don't remove)
                    default:
                        break
                    }
                case .failure(_):
                    showErrorAlert = true
                }
            }
        )
        .signInWithAppleButtonStyle(.black) // Button Style
        .frame(width:243, height:36)
        .cornerRadius(30)
        .shadow(radius: 4, x: 0, y: 4)
        .alert(isPresented: $showErrorAlert, content: {
            Alert(title: Text("ERRO"), message: Text("Erro"), dismissButton: .default(Text("Ok")))
        })

        
    }
    
    func getRandomProfileImage() -> String {
        let randomNum = Int.random(in: 1..<5)
        return "Profile-Pic-\(randomNum)"
    }
}
