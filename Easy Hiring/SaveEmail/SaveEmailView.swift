//
//  SaveEmailView.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 31.10.2022.
//

import SwiftUI

struct SaveEmailView: View {
    
    @StateObject private var viewModel = SaveEmailViewModel()
    @State private var editingTextField = false {
        didSet {
            guard editingTextField != oldValue else {
                return
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50)
                Text("Easy Hiring").font(.system(size: 22).bold())
                Divider()
                Image("mainpage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 360)
                    .cornerRadius(10.0)
                
                Text("Enter the email address\nassociated with your account.").foregroundColor(.gray).font(.system(size: 18)).multilineTextAlignment(.center).lineSpacing(6.0)
                
                
                MaterialDesignTextView($viewModel.email, placeholder: viewModel.placeholder, editing: $editingTextField)
                    .padding()
                    .onTapGesture {
                        editingTextField = true
                    }
                Spacer()
                VStack {
                    NavigationLink(destination: QuestionView(email: $viewModel.email)) {
                        Text("Submit")
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                    }
                    
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        editingTextField = false
                    }
            }
            .padding(.all)
        }
    }
}

struct SaveEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SaveEmailView()
    }
}
