
import SwiftUI

struct Story01_3View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var userName: String = ""
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreyStories.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                SquaresAndLogoView(actualSquare: 0, image : "Story01Icon", text : "Filtros", color: .onnaBackgroundBlack)
                _buildTextandTtle
                Spacer()
            }
            .padding(.top, 100)
            
            NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .homeView}, hasError: .constant(false))
                .padding(.vertical, 400)
                .padding(.horizontal)
                .padding(.trailing, 15)
            
            ExitButtonView(fieldName: "", action: { viewRouter.currentPage = .homeView}, hasError: .constant(false))
                .padding(.leading, -50)
            
            Image("Story01Girl")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading, -200)
                .padding(.horizontal, -20)
                .padding(.vertical, 80)
            //                .frame(width: 600, height: 600, alignment: .leading)
            //
        }
        .padding(.top, 5)
        
    }
}


var _buildTextandTtle: some View {
    HStack {
        VStack (alignment: .trailing) {
            _buildTitle
            _buildDescription
                .padding()
                .padding(.horizontal, 10)
        }
    }
}

var _buildTitle: some View {
    HStack{
        VStack {
            Text("Assim como qualquer parte do nosso corpo, os poros possuem um motivo para existir. ")
                .onnaFont(.body, textSize: 18)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 220, height: 120, alignment: .center)
                .multilineTextAlignment(.trailing);
            
            
            Text("São eles os responsáveis pela liberação de oleosidade e suor.")
                .onnaFont(.title1, textSize: 24)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.trailing)
                .frame(width: 220, height: 160, alignment: .center)
            
            
            Text("Que são substâncias super necessárias para a hidratação natal da pele e regulação de temperatura do corpo. ")
                .onnaFont(.body, textSize: 18)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 220, height: 150, alignment: .center)
                .multilineTextAlignment(.trailing)
        }
        Rectangle()
            .fill(Color.onnaBackgroundBlack)
            .frame(width: 4, height: 400, alignment: .trailing)
            .padding(.top)
        
        
    }
    
    
    .padding(.horizontal)
    .padding(.trailing)
    
    
}

var _buildDescription: some View {
    VStack(alignment: .center) {
        Text("Peles reais possuem poros reais!")
            .onnaFont(.body, textSize: 24)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.onnaBackgroundBlack)
            .frame(width: 300, height: 60, alignment: .center)
        
    }
    .padding(.horizontal)
    .padding(. trailing)
}
struct Story01_3View_Previews: PreviewProvider {
    static var previews: some View {
        Story01_3View()
    }
}
