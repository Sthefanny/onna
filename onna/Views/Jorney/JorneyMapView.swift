
import SwiftUI

struct JorneyMapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var image: String = ""
    @State private var buttom: String = ""
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Image("Journey-0-bg")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .frame(width: 400, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            //                .padding(.leading, 40)
            //                .padding(.vertical, 400)
            
            _buildTitleAndDescription
            _buildSubtitles
            _buildSubtitles2
            _buildSubtitles3
            _buildButtom1
            _buildButtom2
            _buildButtom3
            
        }
    }
    var _buildTitleAndDescription: some View {
        VStack (alignment: .center) {
            _buildTop
        }
    }
}

var _buildTop: some View {
    VStack{
        Text("Mestruação")
            .onnaFont(.title1, textSize: 24)
            .foregroundColor(.onnaBackgroundBlack)
            .multilineTextAlignment(.trailing)
            .frame(width: 160, height: 30, alignment: .center)
            .padding(.trailing, 90)
        
        
        
        Text("aprenda mais sobre ciclos mestruais, tudo sobre aquele seu corpo, aquelas fase que a gente passa todo mês, e ai vamos aprender mais sobre... ")
            .onnaFont(.body, textSize: 18)
            .foregroundColor(.onnaBackgroundBlack)
            .frame(width: 250, height: 150, alignment: .center)
            .multilineTextAlignment(.leading)
        
        //                        .padding(.horizontal)
    }
    .padding(.horizontal,80)
    .padding(.vertical, 150)
}

var  _buildSubtitles: some View {
    Text("Challenge: Desafiamos a você a fazer um controle maior da menstruação")
        .onnaFont(.body, textSize: 15)
        .foregroundColor(.onnaBackgroundBlack)
        .frame(width: 170, height: 120, alignment: .center)
        .multilineTextAlignment(.leading)
        .padding(.leading, 60)
        .padding(.top, 430)
        .padding(.horizontal, 90)
    
}

var  _buildSubtitles2: some View {
    Text("Blog: Aprenda sobre o ciclo mestrual ")
        .onnaFont(.body, textSize: 15)
        .foregroundColor(.onnaBackgroundBlack)
        .frame(width: 150, height: 120, alignment: .center)
        .multilineTextAlignment(.trailing)
        .padding(.leading, 60)
        .padding(.top, 550)
        .padding(.horizontal, 20)
}


var  _buildSubtitles3: some View {
    Text("Quiz: Você consegue acertar todas as perguntas nesse quiz de menstruação")
        .onnaFont(.body, textSize: 15)
        .foregroundColor(.onnaBackgroundBlack)
        .frame(width: 170, height: 120, alignment: .center)
        .multilineTextAlignment(.leading)
        .padding(.leading, 60)
        .padding(.top, 665)
        .padding(.horizontal, 80)
    
}

var _buildButtom1: some View {
    Image("1")
        .resizable()
        .ignoresSafeArea()
        .aspectRatio(contentMode: .fill)
        .frame(width: 70, height: 10, alignment: .center)
        .padding(.top, 475)
        .padding(.horizontal, 70)
    
}
var  _buildButtom2: some View {
    Image("2")
        .resizable()
        .ignoresSafeArea()
        .aspectRatio(contentMode: .fill)
        .frame(width: 70, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.top, 600)
        .padding(.leading, 240)

}
var  _buildButtom3: some View {
    Image("3")
        .resizable()
        .ignoresSafeArea()
        .aspectRatio(contentMode: .fill)
        .frame(width: 70, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.top, 720)
        .padding(.horizontal, 60)

}

struct JorneyMapView_Previews: PreviewProvider {
    static var previews: some View {
        JorneyMapView()
    }
}

