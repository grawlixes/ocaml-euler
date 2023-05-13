open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let getPrime n = 
    let rec aux cur = function 
       | i when (i < n) -> 
           if ((Common.length (Math.divisors cur)) = 2) then
               aux (cur + 1) (i + 1)
           else
               aux (cur + 1) i 
       | _ -> cur - 1 
    in
     aux 2 0
;;

Printf.printf "%d\n" (getPrime 10001);;
