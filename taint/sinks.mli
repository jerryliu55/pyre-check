(** Copyright (c) 2016-present, Facebook, Inc.

    This source code is licensed under the MIT license found in the
    LICENSE file in the root directory of this source tree. *)


type t =
  | Demo
  | FileSystem
  | GetAttr
  | IdentityCreation
  | LocalReturn  (* Special marker to infer function in-out behavior *)
  | Logging
  | NamedSink of string
  | ODS
  | RemoteCodeExecution
  | RequestSend
  | SQL
  | Test
  | Thrift
  | XMLParser
  | XSS
[@@deriving compare, eq, sexp, show, hash]

val parse:
  allowed: string list
  -> string
  -> t
