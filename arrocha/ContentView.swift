//
//  ContentView.swift
//  arrocha
//
//  Created by ifpb on 12/06/23.
//

import SwiftUI

struct ContentView: View {
//    @State var numero = 0
    @ObservedObject var arrochaVM: ArrochaViewModel
    @State private var chute: String = ""
    
    var body: some View {
        VStack{
            HStack{
                editText
                Spacer()
                chuteButton
            }
            Text("Arrocha app")
                .font(.largeTitle)
        }
    }
}

extension ContentView {
    var editText: some View {
        TextEditor(text: $chute)
        .frame(width: 150, height: 60)
    }
}

extension ContentView{
    var chuteButton: some View{
        Button("Chutar"){
            arrochaVM.chutar(guess: Int(chute)!)
        }
        .font(.largeTitle)
        .background(Color.green)
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(arrochaVM: ArrochaViewModel())
    }
}
