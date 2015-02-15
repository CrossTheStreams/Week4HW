1. Good! I tried to use a dedicated class as my `NSTableViewDelegate`, instead of simply setting `ViewController` as the delegate. This worked well, except I ended up using `NSNotificationCenter` in order to keep the class separated completely from `ViewController`. There might be a better way to accomplish that.
2. The XCode documentation for `NSNotificationCenter` and `NSDocument`.
3. `NSNotificationCenter` is very useful for letting the UI know about events. Can this pattern be overused?
