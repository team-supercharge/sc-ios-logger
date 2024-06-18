//
//  LogDetails.swift
//  SCLogger
//

public struct LogDetails {
    public var message: String
    public var originalMessage: Any?
    public var category: Category?
    public var level: LogLevel
    public let metaInfo: LogMetaInfo

    public init(message: String,
                originalMessage: Any?,
                category: Category?,
                level: LogLevel,
                metaInfo: LogMetaInfo) {
        self.message = message
        self.originalMessage = originalMessage
        self.category = category
        self.level = level
        self.metaInfo = metaInfo
    }
}
