//
//  QuestionViewModel.swift
//  Easy Hiring
//
//  Created by Ahmet Bilal KOLSARICI on 1.11.2022.
//

import Foundation

class QuestionViewModel: ViewModel, ObservableObject {
    @Published var questionList: [Question]?
    public static var answerList: [Int] = []
    public static var index = 0
    public static var questionCount = 0
    
    public func getQuestionList() {
        let request = Request(httpMethod: .get, url: Service.Question.get)
        
        Network.shared.request(request: request) { [weak self]
            (response: Result<[Question]?, TDError>) in
            
            switch response {
            case .success(let questionList):
                self?.questionList = questionList
                QuestionViewModel.questionCount = questionList?.count ?? 0
            case .failure(let error):
                self?.errorHandler?(error)
            }
        }
    }
}
