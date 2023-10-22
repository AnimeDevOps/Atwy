//
//  URLRequestExtension.swift
//  Atwy
//
//  Created by Antoine Bollengier on 29.01.23.
//

import Foundation

extension URLRequest {
    mutating func compressAndLoadBody(data: Data) {
        do {
            let compressedData = try ((data as NSData).compressed(using: .zlib) as Data)
            self.httpBody = compressedData
            self.setValue("deflate", forHTTPHeaderField: "Content-Encoding")
            self.setValue("deflate", forHTTPHeaderField: "ENCODING")
        } catch {
            print(error)
            self.httpBody = data
        }
    }
}
