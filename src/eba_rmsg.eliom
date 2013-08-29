module type TError = sig
  type t = private [> Eba_types.error_t ]

  val push : t -> unit
  val has : (t -> bool) -> bool
  val get : (t -> 'a option) -> 'a

  val iter : (t -> unit Lwt.t) -> unit Lwt.t
end

module type TNotice = sig
  type t = private [> Eba_types.notice_t ]

  val push : t -> unit
  val has : (t -> bool) -> bool
  val get : (t -> 'a option) -> 'a

  val iter : (t -> unit Lwt.t) -> unit Lwt.t
end

module type T = sig
  module Error : TError
  module Notice : TNotice
end

module type MT = sig
  type error_t = private [> Eba_types.error_t ]
  type notice_t = private [> Eba_types.notice_t ]
end

module Make(M : MT) = struct
  module Error = Rmsg.Make(struct type t = M.error_t end)
  module Notice = Rmsg.Make(struct type t = M.notice_t end)
end
