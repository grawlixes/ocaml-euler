open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(* only need to consider [11, 20] since [1, 10] divides
 * at least one number in this range
 *)
let nums = Common.range 11 21 1;;

(* Idiotic method that I did for some reason
(Common.range 20 300000000 20)
    |> List.filter 
        ~f:(fun i -> Common.all 
            (List.map ~f:(fun j -> i mod j = 0) nums)
        )
    |> List.fold_left ~f:(fun i j -> min i j) ~init:Int.max_value
    |> Printf.printf "%d\n"
;;
*)

(* Non idiot method *)
nums
    |> List.fold_left ~f:(fun x y -> Math.lcm x y) ~init:1
    |> Printf.printf("%d\n")
;;
