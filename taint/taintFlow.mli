(** Copyright (c) 2018-present, Facebook, Inc.

    This source code is licensed under the MIT license found in the
    LICENSE file in the root directory of this source tree. *)

open Ast
open Statement
open TaintDomains


type flow = {
  source_taint: ForwardTaint.t;
  sink_taint: BackwardTaint.t;
}
[@@deriving sexp]

type flows = flow list

type flow_candidates = {
  candidates: flows;
}

type flow_state = {
  matched: flows;
  rest: flows;
}

val partition_flows:
  ?sources: (TaintSources.t -> bool)
  -> ?sinks: (TaintSinks.t -> bool)
  -> flows
  -> flow_state

val generate_source_sink_matches:
  source_tree: ForwardState.access_path_tree
  -> sink_tree: BackwardState.access_path_tree
  -> flow_candidates

val generate_errors:
  define: Define.t Node.t
  -> location: Location.t
  -> flow_candidates
  -> Interprocedural.Error.t list
