
import SwiftUI

struct Story01_3View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    @State var userName: String = ""
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreyStories.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                SquaresAndLogoView(actualSquare: 2, maxSquare: 3, image : "Story01Icon", text : "Filtros", color: .onnaBackgroundBlack)
                _buildTextandTtle
                Spacer()
            }
            .padding(.top, 5)
            
            ExitButtonView(fieldName: "", action: { viewRouter.currentPage = .homeView}, hasError: .constant(false))
                .padding(.top, 20)
                .padding(.trailing, 10)
            
            Image("Story01Girl")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.leading, -240)
                .padding(.top, 80)
                .padding(.bottom, -200)
                .edgesIgnoringSafeArea(.bottom)
            
        }
        
    }
}


var _buildTextandTtle: some View {
    HStack {
        VStack (alignment: .trailing) {
            _buildTitle
            _buildDescription
        }
    }
    .padding(.leading, 130)
    .padding(.top, 80)
}

var _buildTitle: some View {
    HStack{
        VStack(alignment: .trailing) {
            Text("Assim como qualquer parte do nosso corpo, os poros possuem um motivo para existir. ")
                .onnaFont(.callout, textSize: 16)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 200, height: 130, alignment: .trailing)
                .multilineTextAlignment(.trailing);
            
            
            Text("São eles os responsáveis pela liberação de oleosidade e suor.")
                .onnaFont(.title2, textSize: 20)
                .foregroundColor(.onnaBackgroundBlack)
                .multilineTextAlignment(.trailing)
                .frame(width: 220, height: 130, alignment: .trailing)
            
            
            Text("Que são substâncias super necessárias para a hidratação natal da pele e regulação de temperatura do corpo. ")
                .onnaFont(.callout, textSize: 16)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 160, height: 150, alignment: .trailing)
                .multilineTextAlignment(.trailing)
        }
        Rectangle()
            .fill(Color.onnaBackgroundBlack)
            .frame(width: 6, height: 413, alignment: .center)
        
    }
    .padding(.trailing, 20)
}

var _buildDescription: some View {
    VStack(alignment: .center) {
        Text("Peles reais possuem poros reais!")
            .onnaFont(.subheadline, textSize: 24)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.onnaBackgroundBlack)
            .frame(width: 160, height: 160, alignment: .center)
        
    }
    .padding(.horizontal)
}
struct Story01_3View_Previews: PreviewProvider {
    static var previews: some View {
        Story01_3View()
    }
}
