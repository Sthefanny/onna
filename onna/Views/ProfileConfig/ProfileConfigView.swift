//
//  ProfileConfigView.swift
//  onna
//
//  Created by Sthefanny Gonzaga on 20/09/21.
//

import SwiftUI

struct ProfileConfigView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @ObservedObject var viewModel = UserViewModel()
    let screenWidth = UIScreen.main.bounds.size.width
    @State private var profilePic: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var insta: String = ""
    @State private var phrase: String = ""
    @State private var birthDate = Date()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
            
            Button(action: {
                viewRouter.currentPage = viewRouter.previousPage
            }, label: {
                Label("Voltar", systemImage: "chevron.backward")
                    .onnaFont(.body)
                    .foregroundColor(.onnaWhite)
                    .padding(EdgeInsets(top:0, leading: 14, bottom: 0, trailing: 0))
            })
            
            if (viewModel.user == nil) {
                LoadingView()
            } else {
                VStack {
                    HStack {}.frame(width: screenWidth.magnitude, height: 2, alignment: .center)
                    _buildProfileOptions
                    _buildEditList
                    Spacer()
                    _buildSaveButton
                }
            }
        }
        .onAppear{
            viewModel.getUserInfo { isSuccess in
                profilePic = viewModel.user?.image ?? ""
                firstName = viewModel.user?.firstName ?? ""
                lastName = viewModel.user?.lastName ?? ""
                insta = viewModel.user?.insta ?? ""
                phrase = viewModel.user?.phrase ?? ""
                
                if (viewModel.user?.birthDate != nil) {
                    let dateFormatter = DateFormatter()
                    dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    let date = dateFormatter.date(from:viewModel.user!.birthDate!)!
                
                    birthDate = date
                }
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
    
    var _buildProfileOptions: some View {
        HStack(spacing: 15) {
            _buildProfileButton(image: "Profile-Pic-1")
            _buildProfileButton(image: "Profile-Pic-2")
            _buildProfileButton(image: "Profile-Pic-3")
            _buildProfileButton(image: "Profile-Pic-4")
        }
    }
    
    func _buildProfileButton(image: String) -> some View {
        print("profilePic == \(profilePic)")
        let isSelected = profilePic == image
        
        return Button(action: {}, label: {
            HStack {
                Image(image)
                    .resizable()
                    .clipShape(Circle(), style: FillStyle())
                    .frame(width: 70, height: 70, alignment: .center)
                    .overlay(Circle()
                                .stroke(Color.white, lineWidth: isSelected ? 5 : 0))
            }
        })
        .padding(.top, 50)
    }
    
    var _buildEditList: some View {
        VStack {
            _buildFirstNameTextField
            _buildLastNameTextField
            _buildInstaTextField
            _buildPhraseTextField
            _buildDatePicker
        }
        .padding(.vertical)
        .background(RoundedRectangle(cornerRadius: 20))
        .foregroundColor(.onnaMainGrey.opacity(0.4))
        .padding(.top, 100)
    }
    
    var _buildFirstNameTextField: some View {
        HStack {
            Text("Primeiro Nome:")
            Spacer()
            TextField("" , text: $firstName)
                .placeholder(when: firstName.isEmpty) {
                    Text("Primeiro Nome").foregroundColor(.onnaWhite)
                }
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.onnaMainGrey)
                .padding(.vertical, 8)
        }
        .border(width: 1, edges: [.bottom], color: Color.onnaBlue)
        .frame(width: 300, height: 50, alignment: .leading)
        .padding(.horizontal)
        .foregroundColor(.white)
    }
    
    var _buildLastNameTextField: some View {
        HStack {
            Text("Último Nome:")
            Spacer()
            TextField("" , text: $lastName)
                .placeholder(when: lastName.isEmpty) {
                    Text("Último Nome").foregroundColor(.onnaWhite)
                }
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.onnaMainGrey)
                .padding(.vertical, 8)
        }
        .border(width: 1, edges: [.bottom], color: Color.onnaBlue)
        .frame(width: 300, height: 50, alignment: .leading)
        .padding(.horizontal)
        .foregroundColor(.white)
    }
    
    var _buildInstaTextField: some View {
        HStack {
            Text("Insta:")
            Spacer()
            TextField("" , text: $insta)
                .placeholder(when: insta.isEmpty) {
                    Text("Insta").foregroundColor(.onnaWhite)
                }
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.onnaMainGrey)
                .padding(.vertical, 8)
        }
        .border(width: 1, edges: [.bottom], color: Color.onnaBlue)
        .frame(width: 300, height: 50, alignment: .leading)
        .padding(.horizontal)
        .foregroundColor(.white)
    }
    
    var _buildPhraseTextField: some View {
        HStack {
            Text("Frase:")
            Spacer()
            TextField("" , text: $phrase)
                .placeholder(when: phrase.isEmpty) {
                    Text("Frase").foregroundColor(.onnaWhite)
                }
                .foregroundColor(.white)
                .padding(.vertical, 8)
                .padding(.horizontal, 15)
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.onnaMainGrey)
                .padding(.vertical, 8)
        }
        .border(width: 1, edges: [.bottom], color: Color.onnaBlue)
        .frame(width: 300, height: 50, alignment: .leading)
        .padding(.horizontal)
        .foregroundColor(.white)
    }
    
    var _buildDatePicker: some View {
        HStack {
            DatePicker(selection: $birthDate, in: ...birthDate, displayedComponents: .date) {
                Text("Data de nascimento:")
            }
        }
        .frame(width: 300, height: 50, alignment: .leading)
        .padding(.horizontal)
        .foregroundColor(.white)
    }
    
    var _buildSaveButton: some View {
        Button(action: {
            let dateFormatter = DateFormatter()
            let birthDateString = dateFormatter.string(from: birthDate)
            let updateUser = UserUpdate(image: profilePic, firstName: firstName, lastName: lastName, birthDate: birthDateString, insta: insta, phrase: phrase)
            print("updateUser = \(updateUser)")
            viewModel.updateUser(data: updateUser) { isSuccess in
                if (isSuccess) {
                    print("aeeeee")
                } else {
                    print("oh nous")
                }
            }
        }, label: {
            Text("Salvar Alterações")
                .onnaFont(.body)
                .foregroundColor(.onnaWhite).multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(RoundedRectangle(cornerRadius: 50))
                .foregroundColor(.onnaMainGrey)
        })
    }
}

struct ProfileConfigView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileConfigView()
    }
}


extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}

struct EdgeBorder: Shape {
    
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }
            
            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }
            
            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }
            
            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}
