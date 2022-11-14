open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let s = ref 0 in
(Math.primes_up_to 2_000_000)
    |> Array.iteri 
        ~f:(fun i p -> 
            if p then s := !s + i
        )
;
Printf.printf "%d\n" (!s)
;;
