import Foundation

open enum Printlog {
    
    enum Level {
        case trace, debug,  information, notice, warning, error, critical
        
        var prefix: String {
            
            switch self {
            case .trace: return "🔵 [Trace] 🔵"
            case .debug: return "🟤 [Debug] 🟤"
            case .information: return "🟢 [Information] 🟢"
            case .notice: return "🟡 [Notice] 🟡"
            case .warning: return "🟠 [Warning] 🟠"
            case .error: return "🔴 [Error] 🔴"
            case .critical: return "🟣 [Critical] 🟣"
                
            }
        }
    }

    struct Context {
        let file: String
        let function: String
        let line: Int
        
        var description: String {
            return "\((file as NSString).lastPathComponent) \(function) : \(line)"
        }
    }
    
    fileprivate static func handle(level: Level, string: String, context: Context){
        let component = ["\(level.prefix) : \(string)"].joined(separator: "")
        var message = component
        message += " -> \(context.description)"

        #if DEBUG
        print(message)
        #endif
    }
    
    // Appropriate for messages that contain information only when debugging a program.
    open func trace(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .trace, string: string.description, context: context)
    }
    
    // Appropriate for messages that contain information normally of use only when debugging a program.
    open func debug(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .debug, string: string.description, context: context)
    }
    
    // Appropriate for informational messages.
    open func information(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .information, string: string.description, context: context)
    }
    
    // Appropriate for conditions that are not error conditions, but that may require special handling.
    open func notice(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .notice, string: string.description, context: context)
    }
    
    // Appropriate for messages that are not error conditions, but more severe than .notice
    open func warning(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .warning, string: string.description, context: context)
    }
    
    // Appropriate for error conditions.
    open func error(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .error, string: string.description, context: context)
    }
    
    // Appropriate for critical error conditions that usually require immediate attention.
    open func critical(_ string: String, file: String = #file, function: String = #function, line: Int = #line){
        let context = Context(file: file, function: function, line: line)
        Printlog.handle(level: .critical, string: string.description, context: context)
    }
}

