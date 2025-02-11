/**
 * @name Log entries created from user input
 * @description Building log entries from user-controlled sources is vulnerable to
 *              insertion of forged log entries by a malicious user.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 7.8
 * @precision high
 * @id hikae/log-injection
 * @tags security
 *       external/cwe/cwe-117
 */

import go
import semmle.go.security.LogInjection
import LogInjection::Flow::PathGraph

class RegexpSanitizer extends LogInjection::Sanitizer {
  RegexpSanitizer() {
    exists(DataFlow::CallNode call |
      this = call and
      call.getTarget().getName() = ["ReplaceAllString", "ReplaceAllLiteralString"] and
      call.getReceiver() =
        any(RegexpPattern rp | rp.getPattern().matches("%" + ["\\r", "\\n"] + "%")).getAUse()
    )
  }
}

from LogInjection::Flow::PathNode source, LogInjection::Flow::PathNode sink
where LogInjection::Flow::flowPath(source, sink)
select sink.getNode(), source, sink, "This log entry depends on a $@.", source.getNode(),
  "user-provided value"
