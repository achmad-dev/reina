## make sure to install this first
```
opam install cohttp-lwt-unix cohttp-async
```
## then run this to compile /example/server.ml
```
ocamlfind ocamlopt -o server -package cohttp-lwt-unix -linkpkg -thread server.ml
```
## to run example server
```
./server
```

## for more documentation cohttp
[cohttp](https://github.com/mirage/ocaml-cohttp)