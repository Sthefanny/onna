//
//  ContentTextBodyPositiveView.swift
//  onna
//
//  Created by Deborah Santos on 15/09/21.
//

import SwiftUI

struct ContentTextBodyPositiveView: View {
    
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
                            .padding(.top, -930.0)
                        
                            
                        
                        VStack (alignment: .center){
                            
                            Image ("Body-Positive-Title")
                                .resizable()
                                .frame(width: 353, height: 221)
                                .padding(.top, 127.0)
                            
                            Image("Illustration-4")
                                .resizable()
                                .frame(width: 129, height: 215)
                            
                            Text ("Ame seu corpo")
                                .onnaFont(.title1)
                            
                            Text ("Quando se fala em body positive, muita gente pensa que é só sobre mulheres gordas...    ")
                                .onnaFont(.callout)
                                .multilineTextAlignment(.center)
                                .padding(.top, -1.0)
                            
                            ZStack{
                            
                            Rectangle()
                                    .foregroundColor(.onnaBlue)
                                    .frame( height: 400)
                                    .edgesIgnoringSafeArea(.all)
                                .padding(.top, 45.0)
                                
                               
                            Text (" Pois bem,\n é isso também")
                                .onnaFont(.title1)
                                .multilineTextAlignment(.center)
                                .padding(.top, -113.0)
                                    
                            Text ("Mas não é só isso. Body positive também é sobre homens. Sobre pessoas com deficiência. Sobre pessoas de nariz grande. Sobre gente e suas cicatrizes. Sobre senhoras e senhores com suas rugas. Enfim, é a ideia de ser positivo em relação ao seu corpo.")
                                    .onnaFont(.body
                                    )
                                 .frame(width: 343, height: 157, alignment: .bottom)
                                    .multilineTextAlignment(.center)
                                    .multilineTextAlignment(.center)
                                .padding(.top, 70.0)
                                
                            }
                            
                            ZStack{
                            
                            Rectangle()
                                .foregroundColor(.onnaPink
                                )
                                .frame(height: 500)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, -103.0)
                                
                            
                            Text ("É deixar para trás aqueles “ensinamentos” de que você precisava se enquadrar no padrão imposto pela moda, pelo universo da beleza estética e assim por diante. Body positive é descobrir aspectos positivos do seu corpo que por muito tempo foram considerados fora do padrão. O padrão, hoje, é ser diferente.")
                                .onnaFont(.body)
                                .frame(width: 343, height: 200, alignment: .center)
                                .multilineTextAlignment(.center)
                                .padding(.top, -241.0)
                                .foregroundColor(.onnaBackgroundBlack)
                                .padding()
                                
                            Text("Ser diferentes é o que vai nos unir")
                                .onnaFont(.body)
                                .foregroundColor(.onnaWhite)
                                .frame(width: 230, height: 47, alignment: .center)
                                .multilineTextAlignment(.center)
                                .padding(.top, 10.0)
                                
                            Image ("Illustration-5")
                                .resizable()
                                .frame(width: 226.21, height: 297.12)
                                .padding(.top, 312.0
                                )
                                
                            
                            }
                            .padding(.top, -12.0)
                            
                            
                            
                            ZStack{
                            
                            Rectangle()
                                .foregroundColor(.onnaBackgroundBlack)
                                .frame(height: 300)
                                .edgesIgnoringSafeArea(.all)
                                .padding(.top, -9.0)
                                
                            Image ("Frase-2")
                                .resizable()
                                .frame(width: 281, height: 175, alignment: .top)
                                .padding(.top, -40.0)
                                
                            
                            }

                        }
                        .padding(.top, 5.0)
                        }
                      }
                    }
                }
            }
        


struct ContentTextBodyPositiveView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTextBodyPositiveView()
    }
}
