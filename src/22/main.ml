open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)
let s = 
    (In_channel.read_all "./src/22/input.txt")
;;

let get_upper_code ch =
    if (Char.equal ch '\n') then 0 else
    (Char.to_int ch) - (Char.to_int 'A') + 1
;;

String.split_on_chars ~on:[','] s
    |> List.filter ~f:(fun name -> String.length name > 0)
    |> List.sort ~compare:String.compare
    |> List.mapi ~f:(fun i name ->
            let chars = 
                name
                    |> String.fold ~init:0 ~f:(fun acc ch ->
                            acc + (get_upper_code ch)
                       )
            in
            chars * (i + 1)
       )
    |> List.fold_left ~f:(fun acc v -> acc + v) ~init:0
    |> Printf.printf "%d\n"
;;

