//
//  DCLogger.swift
//  DCLogger
//
//  Created by David Cortes on 7/5/18.
//

import Foundation

public enum LoggerLevel:Int {
    case info = 1
    case debug
    case warning
    case error
    case none
    
    var name:String {
        switch self {
        case .info:
            return "Info"
        case .debug:
            return "Debug"
        case .warning:
            return "Warning"
        case .error:
            return "Error"
        default:
            return "None"
        }
    }
    
    var icon:String {
        switch self {
        case .info:
            return "ℹ️"
        case .debug:
            return "⌨️"
        case .warning:
            return "⚠️"
        case .error:
            return "❌"
        default:
            return "❕"
        }
    }
}

public enum LoggerOutput:String {
    case debuggerConsole
    case deviceConsole
}

public class DCLogger:NSObject {
    
    public static var tag: String?
    public static var level: LoggerLevel = .info
    public static var ouput: LoggerOutput = .debuggerConsole
    
    private override init() {
        super.init()
    }
    
    public class func log(_ level:LoggerLevel, message:String, currentTime:Date, fileName:String, functionName:String, lineNumber:Int, thread:Thread) {
        #if DEBUG
        guard level.rawValue >= self.level.rawValue else { return }
        
        let _fileName = fileName.split(separator: "/")
        let logText = "\(thread.isMainThread ? "[UI]" : "[BG]")[\(_fileName.last ?? "?")#\(functionName)#\(lineNumber)]\(tag ?? "") - \(level.icon) \(level.name): \(message)"
        if self.ouput == .deviceConsole {
            NSLog(logText)
        }else {
            print("\(currentTime.iso8601) \(logText)")
        }
        #endif
    }
    
    public class func info(_ message: String, currentTime: Date = Date(), fileName: String = #file, functionName: String = #function, lineNumber: Int = #line, thread: Thread = Thread.current) {
        log(.info, message: message, currentTime: currentTime, fileName: fileName, functionName: functionName, lineNumber: lineNumber, thread: thread)
    }
    
    public class func debug(_ message: String, currentTime: Date = Date(), fileName: String = #file, functionName: String = #function, lineNumber: Int = #line, thread: Thread = Thread.current) {
        log(.debug, message: message, currentTime: currentTime, fileName: fileName, functionName: functionName, lineNumber: lineNumber, thread: thread)
    }
    
    public class func warning(_ message: String, currentTime: Date = Date(), fileName: String = #file, functionName: String = #function, lineNumber: Int = #line, thread: Thread = Thread.current) {
        log(.warning, message: message, currentTime: currentTime, fileName: fileName, functionName: functionName, lineNumber: lineNumber, thread: thread)
    }
    
    public class func error(_ message: String, currentTime: Date = Date(), fileName: String = #file, functionName: String = #function, lineNumber: Int = #line, thread: Thread = Thread.current) {
        log(.error, message: message, currentTime: currentTime, fileName: fileName, functionName: functionName, lineNumber: lineNumber, thread: thread)
    }
}

public extension Date {
    var millisecondsSince1970:Int {
        return Int((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    var secondsSince1970:Int {
        return Int((self.timeIntervalSince1970).rounded())
    }
    
    init(milliseconds:Int) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
    
    func getCurrentTimeString(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let nowDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = Foundation.TimeZone(identifier: "UTC")
        return formatter.string(from: nowDate)
    }
    
    var iso8601: String {
        return Formatter.iso8601.string(from: self)
    }
}

public extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}

public extension String {
    var dateFromISO8601: Date? {
        return Formatter.iso8601.date(from: self)
    }
}
