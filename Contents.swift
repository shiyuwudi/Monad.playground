//: Playground - noun: a place where people can play

import UIKit

enum Result<T> {
    
    case success(T)
    case failure(NSError)
    
    // Result<T> -> Result<U>
    func map<U>(transform:(T) -> U) -> Result<U>{
        switch self {
        case let .success(value):
            return .success(transform(value))
        case let .failure(error):
            return .failure(error)
        }
    }
    
    func aFunc()  {
        let json2Str = {(json: JSON) -> String in
            return String(json)
        }
        let res1 = map(json2Str)
    }
    
}

struct JSON {
    
}

let res = Result.success(JSON())
let tranformedRes = res.map { (json) -> String in
    return String(json)
}

switch tranformedRes {
case let .success(value):
    print(value)
case let .failure(err):
    print(err)
    
}

