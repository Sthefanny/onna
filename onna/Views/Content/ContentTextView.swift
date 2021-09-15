//
//  ContentTextView.swift
//  onna
//
//  Created by Deborah Santos on 13/09/21.
//

import SwiftUI

struct ContentTextView: View {
    
    var body: some View {
        
                
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                    Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
                    
                    ConteudoVoltarView()
                        .padding(.top, -31.0)
                    
                    ScrollView{
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.onnaGreyStories)
                            .frame(width: 390, height: 730, alignment: .bottom)
                            .padding(.top, -1090)
                        
                        
                        VStack (alignment: .center){
                            
                            Image ("Feminism-Tittle")
                                .resizable()
                                .frame(width: 353, height: 221)
                                .padding(.top, 127.0)
                            
                            Image("Illustration-1")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .padding()
                            
                            Text ("Essa é a Maria")
                                .onnaFont(.title1)
                            
                            Text ("Maria é uma mulher branca, Luta pelos direitos femininos, tal qual como liberdade corporal, direitos iguias, salários equiparados entre gêneros, etc ")
                                .onnaFont(.callout)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            ZStack{
                            
                            Rectangle()
                                    .foregroundColor(.onnaYellow)
                                    .frame( height: 500)
                                    .edgesIgnoringSafeArea(.all)
                                
                            Image ("Balloon-1")
                                .padding(.top, -191.0)
                                .frame(width: 280, height: 101)
                                .padding()
                               
                                
                            Image ("Illustration-2")
                                .resizable()
                                .frame(width: 190, height: 140)
                                .padding(.top, 32.0)
                               
                            Text ("Essa é a Joana")
                                    .onnaFont(.title1)
                                .multilineTextAlignment(.center)
                                .padding(.top, 235.0)
                                    
                            Text ("Maria é uma mulher negra. Para Joana, no meio da reinvidicações de Maria existe uma visão muito privilegiada das coisas  ")
                                    .onnaFont(.callout)
                                    .multilineTextAlignment(.center)
                                    .multilineTextAlignment(.center)
                                .padding(.top, 339.0)
                                
                            }
                            
                            ZStack{
                            
                            Rectangle()
                                .foregroundColor(.onnaGreen)
                                .frame(height: 400)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, -9.0)
                                
                            Image ("Ballon-2")
                                .padding(.top, -150.0)
                                .frame(width: 249.0, height: 101)
                                
                            Image ("Illustration-3")
                                .frame(width: 171, height: 171)
                                .padding(.top, 63.0)
                            
                            Text ("Essa é a Thaís")
                                .onnaFont(.title1)
                                .padding(.top, 264.0)
                                
                            Text ("Thaís é uma mulher indígena  ")
                                .onnaFont(.callout)
                                .multilineTextAlignment(.center)
                                .padding(.top, 324.0)
                            
                            }
                            
                            ZStack{
                            
                            Rectangle()
                                .foregroundColor(.onnaPink)
                                .frame(height: 368)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, -9.0)
                            
                            Rectangle()
                                .foregroundColor(.onnaPink)
                                .border(Color.onnaWhite)
                                .frame(width: 283, height: 275)
                                
                            Text ("Ao conversar com as diversas mulheres, Maria percebeu que embora ela lute pelos direitos femininos, existem diversos tipos de mulheres com diversos tipos de demandas ")
                                .font(.body)
                                .frame(width: 239, height: 165.35, alignment: .top)
                                    .multilineTextAlignment(.center)
                                    .multilineTextAlignment(.center)
                                .foregroundColor(.onnaWhite)
                                .padding(.top, 37.0)
                            }
                            
                            ZStack{
                            
                            Rectangle()
                                .foregroundColor(.onnaBackgroundBlack)
                                .frame(height: 368)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, -9.0)
                                
                            Image ("Frase-1")
                                .resizable()
                                .frame(width: 256, height: 246, alignment: .top)
                            
                            }

                            }
                        }
                    }
                }
            }
        }


struct ContentTextView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTextView()
    }
}
