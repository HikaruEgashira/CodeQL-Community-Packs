/**
 * @name Backwards Partial Dataflow
 * @description Backwards Partial Dataflow
 * @kind table
 * @id hikae/backwards-partial-dataflow
 * @tags template
 */

import go
import semmle.go.dataflow.TaintTracking
import PartialFlow::PartialPathGraph

private module MyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { none() }

  predicate isSink(DataFlow::Node sink) {
    // Define the sink to run the backwards partial dataflow from. Eg:
    // exists(DataFlow::CallNode call |
    //   call.getTarget().hasQualifiedName(_, "sink") and
    //   call.getArgument(0) = sink
    //   )
    none()
  }
}

private module MyFlow = TaintTracking::Global<MyConfig>; // or DataFlow::Global<..>

int explorationLimit() { result = 10 }

private module PartialFlow = MyFlow::FlowExploration<explorationLimit/0>;

from PartialFlow::PartialPathNode n, int dist
where PartialFlow::partialFlowRev(n, _, dist)
select dist, n
