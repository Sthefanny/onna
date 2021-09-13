
import SwiftUI

struct Story01_2View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaGreyStories.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                SquaresAndLogoView(actualSquare: 1, image : "Story01Icon", text : "Filtros", color: .onnaBackgroundBlack)
                _buildTitleAndDescription
                _buildImage
                _buildText2
            }
            .padding(.top, 5)
            
            NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .story01View}, hasError: .constant(false))
                .padding(.vertical, 400)
                .padding(.horizontal)
            
            
            ExitButtonView(fieldName: "", action: { viewRouter.currentPage = .homeView}, hasError: .constant(false))
                .padding(.leading, -50)        }
    }
    
    var _buildTitleAndDescription: some View {
        VStack (alignment: .leading){
            _buildTitle
            _buildDescription
        }
    }
    
    var _buildTitle: some View {
        VStack  {
            Text("Eu me amo com ou sem filtro!")
                .multilineTextAlignment(.trailing)
                .onnaFont(.largeTitle)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 320, height: 100, alignment: .leading)
                .padding(.init(top: 20, leading:0, bottom: 5, trailing: 0))
            
            Rectangle()
                .fill(Color.onnaBackgroundBlack)
                .frame(width: 320, height: 6, alignment: .center)
                .padding()
            
        }
        .padding(.horizontal)
    }
    var _buildDescription: some View {
        VStack {
            Text("Na era dos filtros, blur e efeito “Paris” nos stories, fica cada vez mais difícil gostar do nossos poros e manchinhas, mas confia na gente, você realmente não iria querer viver sem eles. Sua pele e corpo não aguentariam de calor e de substâncias pressas. E suas marchinhas que te fazem únicas, sem elas não existiriam mais ninguém capaz de servir um close assim. ")
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 320, height: 240, alignment: .leading)
                .multilineTextAlignment(.trailing)
            
        }
        .padding(.horizontal)
        .padding(.leading)
    }
    
    
    var _buildImage: some View {
        VStack {
            Image("Story01Image2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
        }
    }
    var _buildText2: some View {
        VStack {
            Text("Por que odiar algo que faz o seu organismo funcionar direito?")
                .onnaFont(.body)
                .multilineTextAlignment(.trailing)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 380, height: 100, alignment: .center)
        }
        .padding(.top, -35)
    
    }
}

struct Story01_2View_Previews: PreviewProvider {
    static var previews: some View {
        Story01_2View()
    }
}
