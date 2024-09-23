import Testing
@testable import Printlog

// Appropriate for messages that contain information only when debugging a program.
@Test func trace() async throws {
    Printlog.trace("Trace Message")
}

// Appropriate for messages that contain information normally of use only when debugging a program.
@Test func debug() async throws {
    Printlog.debug("Debug Message")
}

// Appropriate for informational messages.
@Test func information() async throws {
    Printlog.information("Information Message")
}

// Appropriate for conditions that are not error conditions, but that may require special handling.
@Test func notice() async throws {
    Printlog.notice("Notice Message")
}

// Appropriate for messages that are not error conditions, but more severe than .notice
@Test func warning() async throws {
    Printlog.warning("Warning Message")
}

// Appropriate for error conditions.
@Test func error() async throws {
    Printlog.error("Error Message")
}

// Appropriate for critical error conditions that usually require immediate attention.
@Test func critical() async throws {
    Printlog.critical("Critical Message")
}
