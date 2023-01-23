//
//  QuestionView.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 1.11.2022.
//

import SwiftUI

struct QuestionView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Binding var email: String
    @StateObject var vm = QuestionViewModel()
    var body: some View {
        VStack {
            if vm.questionList != nil {
                if QuestionViewModel.index == 0 {
                    Text("Merhaba: \(email)").padding()
                }
                Text("\(vm.questionList![QuestionViewModel.index].text)").padding()
                OptionsGroupView(options: vm.questionList![QuestionViewModel.index].options)
            }
        }.onAppear {
            if vm.questionList == nil {
                vm.getQuestionList()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
            if QuestionViewModel.index > 0 {
                QuestionViewModel.answerList.removeLast()
                QuestionViewModel.index -= 1
            }
        }){
            Image(systemName: "arrow.left")
        })
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(email: .constant("Test"))
    }
}
