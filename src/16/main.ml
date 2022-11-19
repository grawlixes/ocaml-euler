open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let tbi = Bigint.of_int
in
(Bigint.( ** ) (tbi 2) (tbi 1000))
    |> Bigint.to_string
    |> String.fold 
        ~f:(fun acc ch -> 
            acc + (Common.char_to_int ch)
        ) ~init:0
    |> Printf.printf "%d\n"
;;
