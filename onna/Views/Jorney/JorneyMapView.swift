
import SwiftUI

struct JorneyMapView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var journey: Journey
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            Image("Journey-0-bg")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            
            VStack {
                _buildTitleAndDescription
                _buildChallenge
                _buildQuiz
                _buildBlog
            }
            
        }
    }
    var _buildTitleAndDescription: some View {
        VStack(alignment: .leading) {
            Text(journey.title)
                .onnaFont(.title2, textSize: 20)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.leading)
            
            Text(journey.description)
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.leading)
                .padding(.top, 5)
        }
        .frame(width: 300, height: 200, alignment: .leading)
    }
    
    var  _buildChallenge: some View {
        HStack {
            _buildButtom(text: "1", color: .onnaGreen)
            
            Text("Challenge: Desafiamos a você a fazer um controle maior da menstruação")
                .onnaFont(.body, textSize: 15)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 210, height: 90, alignment: .center)
                .multilineTextAlignment(.leading)
        }
        .offset(x: 20, y: 105)
        
    }
    
    var  _buildQuiz: some View {
        HStack {
            Text("Blog: Aprenda sobre o ciclo mestrual ")
                .onnaFont(.body, textSize: 15)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 210, height: 90, alignment: .center)
                .multilineTextAlignment(.trailing)
            
            _buildButtom(text: "2", color: .onnaYellow)
        }
        .offset(x: -40, y: 120)
    }
    
    
    var  _buildBlog: some View {
        HStack {
            _buildButtom(text: "3", color: .onnaPink)
            
            Text("Quiz: Você consegue acertar todas as perguntas nesse quiz de menstruação")
                .onnaFont(.body, textSize: 15)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 170, height: 90, alignment: .center)
                .multilineTextAlignment(.leading)
        }
        .offset(x: -30, y: 135)
        
    }
    func _buildButtom(text: String, color: Color) -> some View {
        Button(action: {}, label: {
            ZStack {
                Ellipse()
                    .frame(width: 65, height: 65)
                    .foregroundColor(color)
                    .padding(5)
                    .shadow(radius: 4, x: 0, y: 4)
                
                Text(text)
                    .onnaFont(.largeTitle)
                    .foregroundColor(.onnaBackgroundBlack)
                    .multilineTextAlignment(.center)
                    .frame(width: 65, height: 65, alignment: .center)
            }
        })
    }
}

struct JorneyMapView_Previews: PreviewProvider {
    static var previews: some View {
        JorneyMapView(journey: Journey(id: 0, image: "", title: "Menstruaçao", description: "Tudo o que acontece com o seu corpo durante a menstruação", challenge: nil, blog: nil, quiz: nil, dynamicResults: nil))
    }
}

