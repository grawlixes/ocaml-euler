open Core;;
include Lib;;

Printf.printf "\n";;

(* Gets the sum of all numbers divisible by 3 or 5
 * that are less than or equal to 999 *)
(Common.range 0 1000 1)
    |> List.filter ~f:(fun x -> x mod 3 = 0 || x mod 5 = 0)
    |> List.fold_left ~f:(fun x y -> x + y) ~init:0
    |> Printf.printf "%d\n"
;;

(* Old way that I did it *) 
let rec sol = function
  | 0 -> 0
  | m -> (if m mod 3 = 0 || m mod 5 = 0 
          then m 
          else 0) + sol (m - 1) 
