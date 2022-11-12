open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let lim = 101;;

let sq_tot = 
    Math.pow (
        List.sum (module Int) ~f:Fn.id (Common.range 1 lim 1)
    ) 2
;;

(Common.range 1 lim 1)
    |> List.map ~f:(fun x -> x * x)
    |> List.sum (module Int) ~f:Fn.id
    |> fun s -> (sq_tot - s)
    |> Printf.printf "%d\n"
;;

