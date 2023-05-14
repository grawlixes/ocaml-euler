open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)
let ten = Bigint.of_int 10 in
let rec getPow i = 
    if (i = 0) then Bigint.one
    else Bigint.( * ) ten (getPow (i - 1))
in
let lim = getPow 1000 in 
let rec sol l l2 nxt =
    if (Bigint.( = ) nxt lim) then 1
    else (
        let nw = Bigint.( + ) l l2 in
        let newNxt = 
            if (Bigint.( <= ) nw nxt) then nxt
            else (Bigint.( * ) nxt ten)
        in
        1 + (sol nw l newNxt)
    )
in
Printf.printf "%d\n" (sol Bigint.one Bigint.zero Bigint.one);
