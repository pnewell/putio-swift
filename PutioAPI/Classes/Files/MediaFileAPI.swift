import Foundation
import SwiftyJSON

extension PutioAPI {
    public func startMp4Conversion(fileID: Int, completion: @escaping PutioAPIBoolCompletion) {
        let URL = "/files/\(fileID)/mp4"

        self.post(URL)
            .end({ result in
                switch result {
                case .success(let json):
                    return completion(.success(json))
                case .failure(let error):
                    return completion(.failure(error))
                }
            })
    }

    public func getMp4ConversionStatus(fileID: Int, completion: @escaping (Result<PutioMp4Conversion, PutioAPIError>) -> Void) {
        let URL = "/files/\(fileID)/mp4"

        self.get(URL)
            .end({ result in
                switch result {
                case .success(let json):
                    return completion(.success(PutioMp4Conversion(json: json)))
                case .failure(let error):
                    return completion(.failure(error))
                }
            })
    }

    public func getStartFrom(fileID: Int, completion: @escaping (Result<Int, PutioAPIError>) -> Void) {
        let URL = "/files/\(fileID)/start-from"

        self.get(URL)
            .end({ result in
                switch result {
                case .success(let json):
                    return completion(.success(json["start_from"].intValue))
                case .failure(let error):
                    return completion(.failure(error))
                }
            })
    }

    public func setStartFrom(fileID: Int, time: Int, completion: @escaping PutioAPIBoolCompletion) {
        let URL = "/files/\(fileID)/start-from/set"

        self.post(URL)
            .send(["time": time])
            .end({ result in
                switch result {
                case .success(let json):
                    return completion(.success(json))
                case .failure(let error):
                    return completion(.failure(error))
                }
            })
    }

    public func resetStartFrom(fileID: Int, completion: @escaping PutioAPIBoolCompletion) {
        let URL = "/files/\(fileID)/start-from/delete"

        self.get(URL)
            .end({ result in
                switch result {
                case .success(let json):
                    return completion(.success(json))
                case .failure(let error):
                    return completion(.failure(error))
                }
            })
    }
}
