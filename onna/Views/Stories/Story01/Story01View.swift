
import SwiftUI

struct Story01View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
            Color.onnaGreyStories.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                SquaresAndLogoView(actualSquare: 0, maxSquare: 3, image : "Story01Icon", text : "Filtros", color: .onnaBackgroundBlack)
                _buildImage
                _buildTitleAndDescription
                Spacer()
            }
            .padding(.top, 5)
            
            NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .story01_2View}, hasError: .constant(false))
                .padding(.top, 300)
                .padding(.trailing, 30)
            
            ExitButtonView(fieldName: "", action: { viewRouter.currentPage = .homeView}, hasError: .constant(false))
                .padding(.top, 20)
                .padding(.trailing, 30)
        }
    }
    
    var _buildTitleAndDescription: some View {
        VStack (alignment: .leading) {
            _buildTitle
            _buildDescription
        }
        .padding(.leading, 50)
    }
    
    var _buildTitle: some View {
        VStack {
            Text("DENÚNCIA DE\nFAKE NEWS")
                .onnaFont(.largeTitle)
                .multilineTextAlignment(.trailing)
                .foregroundColor(.onnaBackgroundBlack)
                .padding(.top, 30)
            
            Rectangle()
                .fill(Color.onnaBackgroundBlack)
                .frame(width: 320, height: 6, alignment: .center)
                .padding(.top, 5)
                .padding(.trailing, 50)
            
        }
        .padding(.top, -10)
    }
    
    var _buildDescription: some View {
        VStack {
            Text("Peles reais possuem poros reais!")
                .onnaFont(.body)
                .multilineTextAlignment(.trailing)
                .foregroundColor(.onnaBackgroundBlack)
                .padding()
                .frame(width: 380, height: 100, alignment: .center)
        }
        .padding(.top, -35)
        
    }
    
    var _buildImage: some View {
        HStack {
            Image("Story01Gradiente")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
        }
    }
}

struct Story01View_Previews: PreviewProvider {
    static var previews: some View {
        Story01View()
    }
}

