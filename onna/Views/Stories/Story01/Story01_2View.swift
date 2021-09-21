
import SwiftUI

struct Story01_2View: View {
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.onnaGreyStories.edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                SquaresAndLogoView(actualSquare: 1, maxSquare: 3, image : "Story01Icon", text : "Filtros", color: .onnaBackgroundBlack)
                _buildTitleAndDescription
                _buildImage
                _buildText2
                    
            }
            .padding(.top, 50)
            
            NextRoundedButtonView(fieldName: "", action: {viewRouter.currentPage = .story01_3View}, hasError: .constant(false))
                .padding(.top, 300)
                .padding(.trailing, 10)
            
            
            ExitButtonView(fieldName: "", action: { viewRouter.currentPage = .homeView}, hasError: .constant(false))
                .padding(.top, 20)
                .padding(.trailing, 10)
        }
    }
    
    var _buildTitleAndDescription: some View {
        VStack (alignment: .leading){
            _buildTitle
            _buildDescription
        }
    }
    
    var _buildTitle: some View {
        VStack(alignment: .leading)  {
            Text("Eu me amo com ou sem filtro!")
                .multilineTextAlignment(.leading)
                .onnaFont(.largeTitle)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 320, height: 100, alignment: .leading)
                .padding(.init(top: 20, leading:0, bottom: 5, trailing: 0))
            
            Rectangle()
                .fill(Color.onnaBackgroundBlack)
                .frame(width: 260, height: 6, alignment: .leading)
                .padding(.top, -10)
            
        }
        .padding(.leading, 30)
    }
    var _buildDescription: some View {
        VStack(alignment: .leading) {
            Text("Na era dos filtros, blur e efeito “Paris” nos stories, fica cada vez mais difícil gostar do nossos poros e manchinhas, mas confia na gente, você realmente não iria querer viver sem eles. Sua pele e corpo não aguentariam de calor e de substâncias pressas. E suas marchinhas que te fazem únicas, sem elas não existiriam mais ninguém capaz de servir um close assim. ")
                .multilineTextAlignment(.leading)
                .onnaFont(.body)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 300, height: 240, alignment: .leading)
                .multilineTextAlignment(.trailing)
               

            
        }
        .padding(.leading, 30)
    }
    
    
    var _buildImage: some View {
        VStack(alignment: .trailing) {
            Image("Story01Image2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
                .padding( .vertical, 10)
        }
        .padding(.horizontal)
    }
    var _buildText2: some View {
        VStack(alignment: .trailing) {
            Text("Por que odiar algo que faz o seu organismo funcionar direito?")
                .onnaFont(.title2)
                .multilineTextAlignment(.trailing)
                .foregroundColor(.onnaBackgroundBlack)
                .frame(width: 330, height: 100, alignment: .trailing)
        }
        .padding(.horizontal)
        .padding(.top, -20)
        
    }
}

struct Story01_2View_Previews: PreviewProvider {
    static var previews: some View {
        Story01_2View()
    }
}
