open Lwt.Infix
open Cohttp
open Cohttp_lwt_unix

let hello_world_handler _req _body =
  let body = "Hello, World!" in
  Server.respond_string ~status:`OK ~body ()

let start_server () =
  let port = 8080 in
  let callback _conn req body =
    match Request.uri req |> Uri.path with
    | "/" -> hello_world_handler req body
    | _ -> Server.respond_not_found ()
  in
  let server = Server.make ~callback () in
  let mode = `TCP (`Port port) in
  Server.create ~mode server

let () =
  Lwt_main.run (start_server ())
