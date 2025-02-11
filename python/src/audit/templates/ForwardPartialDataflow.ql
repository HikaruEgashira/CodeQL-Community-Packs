/**
 * @name Forward Partial Dataflow
 * @description Forward Partial Dataflow
 * @kind table
 * @id hikae/forward-partial-dataflow
 * @tags template
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.ApiGraphs
import PartialFlow::PartialPathGraph

private module MyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    // Define the source to run the forward partial dataflow from. Eg:
    // exists(DataFlow::CallCfgNode call |
    //   call = API::moduleImport("sample").getMember("source").getACall() and
    //   source = call
    // )
    none()
  }

  predicate isSink(DataFlow::Node sink) { none() }
}

private module MyFlow = TaintTracking::Global<MyConfig>; // or DataFlow::Global<..>

int explorationLimit() { result = 10 }

private module PartialFlow = MyFlow::FlowExploration<explorationLimit/0>;

from PartialFlow::PartialPathNode n, int dist
where PartialFlow::partialFlow(_, n, dist)
select dist, n
