//
//  Chat01View.swift
//  onna
//
//  Created by Deborah Santos on 09/09/21.

//duvidinhas: crio um componente pra esse text field?
//crio um componente pras respostas (chat?)
// N consigo mudar a cor do "escreva aqui"

import SwiftUI



struct ChatView: View {
    @State var username: String = ""
    
    
    var body: some View {
   
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)


            VStack{
                
                ForwardButtonView ()
                    .offset(x: 120, y: 7)
                    .padding()
                
                ChatQuestionView()
                   
                    
                ScrollView{
                VStack (alignment:.center){
                   
                    ChatAwnsersView ()
                        .padding()
                    ChatAwnsersView ()
                        .padding()
                    ChatAwnsersView()
                        .padding()
                    ChatAwnsersView()
                        .padding()
                    
                             }
                         }
                
                    Spacer ()
                
                    TextFieldWithButtonChat (fieldName: "Nome", action:{})
                        .padding(.horizontal, 20)
                    
                      }
                   
                }
            }
            
        }
        
    
    

        
struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView ()
    }
}


