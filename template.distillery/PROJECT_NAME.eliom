(* This file was generated by Ocsigen Start.
   Feel free to use it, modify it, and redistribute it as you wish. *)

let%shared () =
  (* Registering services. Feel free to customize handlers. *)
  Eliom_registration.Action.register
    ~service:Os_services.set_personal_data_service
    %%%MODULE_NAME%%%_handlers.set_personal_data_handler;

  Eliom_registration.Action.register
    ~service:Os_services.set_password_service
    %%%MODULE_NAME%%%_handlers.set_password_handler;

  Eliom_registration.Action.register
    ~service:Os_services.forgot_password_service
    %%%MODULE_NAME%%%_handlers.forgot_password_handler;

  Eliom_registration.Action.register
    ~service:Os_services.preregister_service
    %%%MODULE_NAME%%%_handlers.preregister_handler;

  Eliom_registration.Action.register
    ~service:Os_services.sign_up_service
    Os_handlers.sign_up_handler;

  Eliom_registration.Action.register
    ~service:Os_services.connect_service
    Os_handlers.connect_handler;

  Eliom_registration.Unit.register
    ~service:Os_services.disconnect_service
    (Os_handlers.disconnect_handler ~main_page:true);

  Eliom_registration.Any.register
    ~service:Os_services.action_link_service
    (Os_session.Opt.connected_fun
       %%%MODULE_NAME%%%_handlers.action_link_handler);

  Eliom_registration.Action.register
    ~service:Os_services.add_email_service
    Os_handlers.add_email_handler;

  Eliom_registration.Action.register
    ~service:Os_services.update_language_service
    Os_handlers.update_language_handler;

  %%%MODULE_NAME%%%_base.App.register
    ~service:Os_services.main_service
    (%%%MODULE_NAME%%%_page.Opt.connected_page %%%MODULE_NAME%%%_handlers.main_service_handler);

  %%%MODULE_NAME%%%_base.App.register
    ~service:%%%MODULE_NAME%%%_services.about_service
    (%%%MODULE_NAME%%%_page.Opt.connected_page %%%MODULE_NAME%%%_handlers.about_handler);

  %%%MODULE_NAME%%%_base.App.register
    ~service:%%%MODULE_NAME%%%_services.settings_service
    (%%%MODULE_NAME%%%_page.Opt.connected_page %%%MODULE_NAME%%%_handlers.settings_handler)

let%server () =
  Eliom_registration.Ocaml.register
    ~service:%%%MODULE_NAME%%%_services.upload_user_avatar_service
    (Os_session.connected_fun %%%MODULE_NAME%%%_handlers.upload_user_avatar_handler)


(* Print more debugging information when <debugmode/> is in config file
   (DEBUG = yes in Makefile.options).
   Example of use:
   let section = Lwt_log.Section.make "%%%MODULE_NAME%%%:sectionname"
   ...
   Lwt_log.ign_info ~section "This is an information";
   (or ign_debug, ign_warning, ign_error etc.)
 *)
let%server _ =
  if Eliom_config.get_debugmode ()
  then begin
    ignore
      [%client (
        (* Eliom_config.debug_timings := true; *)
        (* Lwt_log_core.add_rule "eliom:client*" Lwt_log.Debug; *)
        (* Lwt_log_core.add_rule "os*" Lwt_log.Debug; *)
        Lwt_log_core.add_rule "%%%MODULE_NAME%%%*" Lwt_log.Debug
        (* Lwt_log_core.add_rule "*" Lwt_log.Debug *)
        : unit ) ];
    (* Lwt_log_core.add_rule "*" Lwt_log.Debug *)
    Lwt_log_core.add_rule "%%%MODULE_NAME%%%*" Lwt_log.Debug
  end
