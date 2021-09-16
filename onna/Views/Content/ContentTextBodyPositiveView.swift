//
//  ContentTextBodyPositiveView.swift
//  onna
//
//  Created by Deborah Santos on 15/09/21.
//

import SwiftUI

struct ContentTextBodyPositiveView: View {
    
    var body: some View{
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                Color.onnaBackgroundBlack.edgesIgnoringSafeArea(.all)
                
                ConteudoVoltarView()
                    .padding(.top, -31.0)
                
                ScrollView{
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.onnaGreyStories)
                        .frame(width: 390, height: 730, alignment: .bottom)
                        .padding(.top, -958.0)
                        
                    
                    VStack (alignment: .center) {
                        
                        Image ("Body-Positive-Title")
                        .resizable()
                        .frame(width: 353, height: 221.42)
                            .padding(.top, 123.0)
                        
                        Image("Illustration-4")
                            .resizable()
                            .frame(width: 129, height: 215.3)
                            .padding()
                        
                        Text ("Ame o seu corpo")
                            .onnaFont(.title1)
                        
                        Text("Quando se fala em body positive, muita gente pensa que é só sobre mulheres gordas...   ")
                            .onnaFont(.callout)
                            .multilineTextAlignment(.center)
                            .padding()
                            .padding()
                        
                        Image ("background-content")
                            .resizable()
                           .frame(width: 400, height: 1104)
                       
                      
                        Text (" Pois bem,\n é isso também")
                            .onnaFont(.title1)
                            .multilineTextAlignment(.center)
                            .padding(.top, -1060.0)
                        
                        Text ("Mas não é só isso. Body positive também é sobre homens. Sobre pessoas com deficiência. Sobre pessoas de nariz grande. Sobre gente e suas cicatrizes. Sobre senhoras e senhores com suas rugas. Enfim, é a ideia de ser positivo em relação ao seu corpo. ")
                            .onnaFont(.callout)
                            .multilineTextAlignment(.center)
                            .padding(.top, -1010.0)
                            .padding()
                            .padding()
                        
                        Text ("É deixar para trás aqueles “ensinamentos” de que você precisava se enquadrar no padrão imposto pela moda, pelo universo da beleza estética e assim por diante. Body positive é descobrir aspectos positivos do seu corpo que por muito tempo foram considerados fora do padrão. O padrão, hoje, é ser diferente. ")
                            .onnaFont(.callout)
                            .multilineTextAlignment(.center)
                            .padding(.top, -700.0)
                            .padding()
                            .padding()
                            
                        Text ("Ser diferentes é o que\n vai nos unir!")
                            .onnaFont(.title1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.onnaWhite)
                            .padding(.top, -550.0)
                        
                        Image("Frase-2")
                            .resizable()
                            .padding(.top, -164.0)
                            .frame(width: 281, height: 17)
                            .padding()
                            .padding()
                        
                        
                         }
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

