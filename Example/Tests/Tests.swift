// https://github.com/Quick/Quick

import Quick
import Nimble
import DCLogger

class TableOfContentsSpec: QuickSpec {
    
    var stderrSave: Int32 = 0
    var logFilePath: String {
        get {
            let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
            return documentsPath! + "/testlog.txt"
        }
    }
    
    // Will be called before you want to have all logs being redirected to your logile
    func startLogging() {
        self.stderrSave = dup(STDERR_FILENO)
        freopen(self.logFilePath.cString(using: .ascii), "a+", stderr)
    }
    
    // Will be called when you want to stop redirecting all logs to a separate file
    func closeLogging() {
        fflush(stderr);
        dup2(stderrSave,STDERR_FILENO);
        close(stderrSave);
        try? FileManager.default.removeItem(atPath: self.logFilePath)
    }
    
    // Search for the according string
    func recordLog(logged string:String) -> Bool {
        let content = try? String(contentsOfFile: self.logFilePath)
        return (content?.contains(string))!
    }
    
    override func spec() {
        
        describe("these will test logs") {
            
            it("test info logs") {
                let date = Date()
                self.startLogging()
                DCLogger.ouput = .deviceConsole
                DCLogger.log(.info, message: "test", currentTime: date, fileName: "Test.swift", functionName: "test", lineNumber: 1, thread: Thread())
                let isRecorded = self.recordLog(logged: "ℹ️ Info")
                self.closeLogging()
                expect(isRecorded) == true
            }
            
            it("test debug logs") {
                let date = Date()
                self.startLogging()
                DCLogger.ouput = .deviceConsole
                DCLogger.log(.debug, message: "test", currentTime: date, fileName: "Test.swift", functionName: "test", lineNumber: 1, thread: Thread())
                let isRecorded = self.recordLog(logged: "⌨️ Debug")
                self.closeLogging()
                expect(isRecorded) == true
            }
            
            it("test warning logs") {
                let date = Date()
                self.startLogging()
                DCLogger.ouput = .deviceConsole
                DCLogger.log(.warning, message: "test", currentTime: date, fileName: "Test.swift", functionName: "test", lineNumber: 1, thread: Thread())
                let isRecorded = self.recordLog(logged: "⚠️ Warning")
                self.closeLogging()
                expect(isRecorded) == true
            }
            
            it("test error logs") {
                let date = Date()
                self.startLogging()
                DCLogger.ouput = .deviceConsole
                DCLogger.log(.error, message: "test", currentTime: date, fileName: "Test.swift", functionName: "test", lineNumber: 1, thread: Thread())
                let isRecorded = self.recordLog(logged: "❌ Error")
                self.closeLogging()
                expect(isRecorded) == true
            }
            
            it("test none logs") {
                let date = Date()
                self.startLogging()
                DCLogger.ouput = .deviceConsole
                DCLogger.log(.none, message: "test", currentTime: date, fileName: "Test.swift", functionName: "test", lineNumber: 1, thread: Thread())
                let isRecorded = self.recordLog(logged: "❕ None")
                self.closeLogging()
                expect(isRecorded) == true
            }
        }
        
//        describe("these will fail") {
//
//            it("can do maths") {
//                expect(1) == 2
//            }
//
//            it("can read") {
//                expect("number") == "string"
//            }
//
//            it("will eventually fail") {
//                expect("time").toEventually( equal("done") )
//            }
//
//            context("these will pass") {
//
//                it("can do maths") {
//                    expect(23) == 23
//                }
//
//                it("can read") {
//                    expect("🐮") == "🐮"
//                }
//
//                it("will eventually pass") {
//                    var time = "passing"
//
//                    DispatchQueue.main.async {
//                        time = "done"
//                    }
//
//                    waitUntil { done in
//                        Thread.sleep(forTimeInterval: 0.5)
//                        expect(time) == "done"
//
//                        done()
//                    }
//                }
//            }
//        }
    }
}
