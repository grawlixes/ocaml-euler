open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)
let sum = 
    List.fold_left ~init:0 ~f:(fun acc x ->
        acc + x
    )
;;

let lim = 10000 in
Common.range 1 lim 1
    |> List.filter ~f:(fun x ->
           let sd = sum (Math.divisors x) - x in
           let si = sum (Math.divisors sd) - sd in
           x = si && x <> sd
       )
    |> sum
    |> Printf.printf "%d\n"
;;
