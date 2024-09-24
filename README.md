# Printlog

```
[Log type] : Log Message -> File Function : Line
```

You can mark logs with 7 different labels.

1. Trace:
```swift
Printlog.trace("Trace Message")
```
```
🔵 [Trace] 🔵 : Trace Message -> PrintlogTests.swift trace() : 6
```

2. Debug:
```swift
Printlog.debug("Debug Message")
```
```
🟤 [Debug] 🟤 : Debug Message -> PrintlogTests.swift debug() : 11
```

3. Information: Appropriate for informational messages.
```swift
Printlog.information("Information Message")
```
```
🟢 [Information] 🟢 : Information Message -> PrintlogTests.swift information() : 16
```

4. Notice: Appropriate for conditions that are not error conditions, but that may require special handling.
```swift
Printlog.notice("Notice Message")
```
```
🟡 [Notice] 🟡 : Notice Message -> PrintlogTests.swift notice() : 21
```

5. Warning: Appropriate for messages that are not error conditions, but more severe than "notice".
```swift
Printlog.warning("Warning Message")
```
```
🟠 [Warning] 🟠 : Warning Message -> PrintlogTests.swift warning() : 26
```

6. Error: Appropriate for error conditions.
```swift
Printlog.error("Error Message")
```
```
🔴 [Error] 🔴 : Error Message -> PrintlogTests.swift error() : 31
```

7. Critical: Appropriate for critical error conditions that usually require immediate attention.
```swift
Printlog.critical("Critical Message")
```
```
🟣 [Critical] 🟣 : Critical Message -> PrintlogTests.swift critical() : 36
```

