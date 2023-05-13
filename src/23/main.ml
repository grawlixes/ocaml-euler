open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let lim = 28123;;
let is_abundant n = 
    (Common.int_list_sum (Math.divisors n) - n) > n
;;

let abundant = 
    Common.range 1 lim 1
        |> List.filter ~f:is_abundant
        |> Hash_set.of_list (module Int)
;;

Common.range 1 lim 1
    |> List.filter ~f:(fun n ->
            Hash_set.for_all ~f:(fun ab ->
                not (Hash_set.mem abundant (n - ab))
            ) abundant
       )
    |> Common.int_list_sum
    |> Printf.printf "%d\n"
;;
