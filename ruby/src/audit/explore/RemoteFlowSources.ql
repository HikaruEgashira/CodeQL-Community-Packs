/**
 * @name Attack Surface
 * @description Application attack surface
 * @kind table
 * @id hikae/attack-surface
 * @tags audit
 */

import ruby
import codeql.ruby.dataflow.RemoteFlowSources

from RemoteFlowSource source, Location l
where
  not source.getLocation().getFile().getRelativePath().matches("%/test/%") and
  l = source.getLocation()
select source, source.getSourceType(), l.getFile().getRelativePath(), l.getStartLine(),
  l.getEndLine(), l.getStartColumn(), l.getEndColumn()
