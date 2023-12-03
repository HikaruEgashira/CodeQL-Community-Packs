/**
 * @id hikae/cg
 * @kind graph
 */

import codeql.ruby.AST

class CallOrCallable extends Expr {
  CallOrCallable() { this instanceof Call or this instanceof Callable }
}

query predicate nodes(CallOrCallable node, string key, string value) {
  key = "semmle.label" and
  value =
    node.getFile().getBaseName() + " > " + node.getEnclosingCallable() + " > " + node.toString()
  or
  key = "semmle.order" and
  value =
    any(int i |
      node =
        rank[i](CallOrCallable m, Location l |
          l = m.getLocation()
        |
          m
          order by
            l.getFile().getBaseName(), l.getFile().getAbsolutePath(), l.getStartLine(),
            l.getStartColumn(), l.getEndLine(), l.getEndColumn(), m.toString()
        )
    ).toString()
}

query predicate edges(CallOrCallable source, CallOrCallable target, string key, string value) {
  key = "semmle.label" and
  target = source.(Call).getATarget() and
  value = "call"
  or
  key = "semmle.order" and
  value =
    any(int i |
      target =
        rank[i](Callable t, Location l |
          t = source.(Call).getATarget() and
          l = t.getLocation()
        |
          t
          order by
            l.getFile().getBaseName(), l.getFile().getAbsolutePath(), l.getStartLine(),
            l.getStartColumn(), l.getEndLine(), l.getEndColumn(), t.toString()
        )
    ).toString()
}
