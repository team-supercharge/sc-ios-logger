//
//  CustomRemoteLogDecorator.swift
//  Logger_Example
//

import Foundation
import Logger

class CustomRemoteLogDecorator: RemoteLogDecorator {
    // MARK: - Types

    struct LogVariables: Codable {
        let device: DeviceInfo?
        var message: String?
    }

    struct DeviceInfo: Codable {
        let id: String
        let os: OSInfo

        init(id: String, os: OSInfo) {
            self.id = id
            self.os = os
        }

        public struct OSInfo: Codable {
            let platform: Platform
            let version: String

            public enum Platform: String, Codable {
                case ios, android
            }
        }
    }

    lazy var deviceInfo: DeviceInfo = {
        let id = UIDevice.current.model
        let os = DeviceInfo.OSInfo(platform: DeviceInfo.OSInfo.Platform.ios,
                                   version: UIDevice.current.systemVersion)

        return DeviceInfo(id: id, os: os)
    }()

    func decorateLogMessage(with message: String) -> String {
        let vars = LogVariables(device: deviceInfo,
                                message: message)

        guard let jsonData = try? JSONEncoder().encode(vars), let jsonString = String(data: jsonData, encoding: .utf8) else { return message }

        return jsonString
    }
}
