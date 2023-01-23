//
//  OptionsGroupView.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 18.11.2022.
//

import SwiftUI

struct OptionsGroupView: View {
    var options: [Option]
    var body: some View {
        List {
            ForEach(options, id: \.id) { option in
                ZStack(alignment: .leading) {
                    Button(option.text, action: {
                        QuestionViewModel.answerList.append(option.id)
                        QuestionViewModel.answerList.forEach { prime in
                            print("\(prime)")
                        }
                        if QuestionViewModel.index + 1 < QuestionViewModel.questionCount  {
                            QuestionViewModel.index += 1
                        }
                    })
                    if QuestionViewModel.index + 1 < QuestionViewModel.questionCount  {
                        NavigationLink(destination: QuestionView(email: .constant(""))) {
                            EmptyView()
                        }.opacity(0).buttonStyle(PlainButtonStyle())
                    } else {   
//                        NavigationLink(destination: Text("Tebrikler testi tamamladiniz!")) {
//                            EmptyView()
//                        }.opacity(0).buttonStyle(PlainButtonStyle()).navigationBarBackButtonHidden()
                        NavigationLink("", destination: CompletionView())
                    }
                }
            }
        }
    }
}

struct OptionsGroupView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsGroupView(options: [])
    }
}
