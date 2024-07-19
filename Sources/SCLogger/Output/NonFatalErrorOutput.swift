//
//  NonFatalErrorOutput.swift
//  SCLogger
//

import Foundation

// Note: Do not forget to mark properties as private in the logged structure,
// becase it's not allowed to send personal data to a 3rd pary (GDPR)

public final class NonFatalErrorOutput {

    // MARK: - Types

    public enum Mode {
        case onlyNonFatals(nonFatalFrom: LogLevel)
        case nonFatalsWithLog(logFrom: LogLevel, nonFatalFrom: LogLevel)

        var nonFatalFrom: LogLevel {
            switch self {
            case .onlyNonFatals(let nonFatalFrom):
                return nonFatalFrom
            case .nonFatalsWithLog(_, let nonFatalFrom):
                return nonFatalFrom
            }
        }
    }

    // MARK: Properties

    public var formatters = [Formatter]()
    public var filters = [Filter]()

    private let mode: Mode
    private let loggerClosure: ((String) -> Void)?
    private let nonFatalLoggerClosure: ((Error) -> Void)?

    // MARK: Init

    public init(mode: Mode, loggerClosure: ((String) -> Void)?, nonFatalLoggerClosure: ((Error) -> Void)?) {
        self.mode = mode
        self.loggerClosure = loggerClosure
        self.nonFatalLoggerClosure = nonFatalLoggerClosure
    }
}

// MARK: - Output

extension NonFatalErrorOutput: Output {
    public func write(details: LogDetails, finalMessage: String) {

        // Log everything to the injected log service
        if case .nonFatalsWithLog(let logFrom, _) = mode,
           details.level >= logFrom {
            loggerClosure?(finalMessage)
        }

        guard details.level >= mode.nonFatalFrom else { return }

        // Log non-fatal issues

        let userInfo = [ "Log message": finalMessage ]
        let fileName = details.metaInfo.fileName.split(separator: "/").last?.description ?? details.metaInfo.fileName
        let errorDomain = [fileName,
                           details.metaInfo.functionName,
                           details.metaInfo.lineNumber.description]
            .joined(separator: " ")
        let error = NSError(domain: errorDomain, code: -1001, userInfo: userInfo)

        nonFatalLoggerClosure?(error)
    }
}
