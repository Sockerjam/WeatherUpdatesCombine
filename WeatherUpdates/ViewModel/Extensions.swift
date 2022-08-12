//
//  Extensions.swift
//  WeatherUpdates
//
//  Created by Niclas Jeppsson on 01/06/2022.
//

import Foundation
import Combine

extension Publisher {
    
    func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        self
            .map(Result.success)
            .catch { error in
                Just(.failure(error))
            }
            .eraseToAnyPublisher()
    }
}
