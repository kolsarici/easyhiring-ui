//
//  CompletionView.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 6.12.2022.
//

import SwiftUI

struct CompletionView: View {
    var body: some View {
        VStack {
            Text("Congrats you are comleted the test!").font(.system(size: 22))
            Button("Exit") {
                SaveEmailView()
            }
        }.padding(.all).navigationBarBackButtonHidden()
        
        
    }
}

struct CompletionView_Previews: PreviewProvider {
    static var previews: some View {
        CompletionView()
    }
}
