open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)
(Common.range 2 101 1)
    |> List.fold_left ~init:Bigint.one ~f:(fun acc x ->
           Bigint.( * ) acc (Bigint.of_int x)
       )
    |> Bigint.to_string
    |> String.fold ~init:0 ~f:(fun acc ch -> 
           acc + Char.get_digit_exn ch
       )
    |> Printf.printf "%d\n"
;; 
