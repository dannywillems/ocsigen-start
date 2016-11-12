(* Ocsigen-start
 * http://www.ocsigen.org/ocsigen-start
 *
 * Copyright (C) Université Paris Diderot, CNRS, INRIA, Be Sport.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

(* -------------------------------------------------------------------------- *)
(** Shared types definitions between the OAuth2.0 client and server *)

val size_state              : int
val size_client_id          : int
val size_token              : int
val size_client_secret      : int
val size_authorization_code : int

(** -------------------------- *)
(** A type representing a client. It's not mandatory that the OAuth2.0 client
 * knows his data so this type is only declared server-side *)

(** -------------------------- *)
(** Type of client credentials *)

type client_credentials

val client_credentials_of_str :
  client_id:string      ->
  client_secret:string  ->
  client_credentials

val client_credentials_id     : client_credentials -> string
val client_credentials_secret : client_credentials -> string

(** Type of client credentials *)
(** -------------------------- *)

(** ---------------------------------- *)
(** Error types for authorization code *)

type error_authorization_code_type =
  | Auth_invalid_request
  | Auth_unauthorized_client
  | Auth_access_denied
  | Auth_unsupported_response_type
  | Auth_invalid_scope
  | Auth_server_error
  | Auth_temporarily_unavailable

val error_authorization_code_type_to_str  :
  error_authorization_code_type     ->
  string

(** Error types for authorization code *)
(** ---------------------------------- *)

(** --------------------- *)
(** Error types for token *)

type error_token_type =
  | Token_invalid_request
  | Token_unauthorized_client
  | Token_invalid_client
  | Token_invalid_grant
  | Token_unsupported_grant_type
  | Token_invalid_scope

val error_token_type_to_str               :
  error_token_type                  ->
  string

(** Error types for token *)
(** --------------------- *)

val param_authorization_code :
  (
    Eliom_service.get,
    string * (string * (string * (string * string))),
    [ `One of string ] Eliom_parameter.param_name *
    ([ `One of string ] Eliom_parameter.param_name *
     ([ `One of string ] Eliom_parameter.param_name *
      ([ `One of string ] Eliom_parameter.param_name *
       [ `One of string ] Eliom_parameter.param_name))),
    unit,
    unit,
    [ `WithoutSuffix ],
    (*Eliom_service.get,*)
    unit
  )
  Eliom_service.meth

val param_authorization_code_response :
  (
    Eliom_service.get,
    string * string,
    [ `One of string ] Eliom_parameter.param_name *
      [ `One of string ] Eliom_parameter.param_name,
    unit,
    unit,
    [ `WithoutSuffix ],
    (*Eliom_service.get,*)
    unit
  )
  Eliom_service.meth

val param_authorization_code_response_error :
  (
    Eliom_service.get,
    string * (string option * (string option * string)),
    [ `One of string ] Eliom_parameter.param_name *
    ([ `One of string ] Eliom_parameter.param_name *
     ([ `One of string ] Eliom_parameter.param_name *
      [ `One of string ] Eliom_parameter.param_name)),
    unit,
    unit,
    [ `WithoutSuffix ],
    (*Eliom_service.get,*)
    unit
  )
  Eliom_service.meth

val param_access_token :
  (
    Eliom_service.post,
    unit,
    unit,
    string * (string * (string * (string * string))),
    [ `One of string ] Eliom_parameter.param_name *
    ([ `One of string ] Eliom_parameter.param_name *
     ([ `One of string ] Eliom_parameter.param_name *
      ([ `One of string ] Eliom_parameter.param_name *
       [ `One of string ] Eliom_parameter.param_name))),
    [ `WithoutSuffix ],
    (*Eliom_service.get,*)
    unit
  )
  Eliom_service.meth

(* -------------------------------------------------------------------------- *)

val remove_from_list :
  ('a -> bool) ->
  'a list      ->
  'a list

val update_list_timer :
  int ->
  ('a -> bool) ->
  ('a -> unit) ->
  'a list ref ->
  unit    ->
  unit

val generate_random_string :
  int  ->
  string

val prefix_and_path_of_url :
  Ocsigen_lib.Url.t ->
  string * string list
