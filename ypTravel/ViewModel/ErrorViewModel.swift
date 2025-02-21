//
//  ErrorViewModel.swift
//  ypTravel
//
//  Created by Олег Кор on 20.02.2025.
//


enum ErrorViewModel {
    case internetError
    case serverError
    
    var type: ErrorStruct {
        switch self {
            case .internetError:
            return ErrorStruct(errorImage: "InternerErrorImage", errorText: "Нет интернета")
        case .serverError:
            return ErrorStruct(errorImage: "ServerErrorImage", errorText: "Ошибка сервера")
        }
    }
}
