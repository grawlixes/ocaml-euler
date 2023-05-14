(* 2783915460 *)

open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)
let n = 10 in
let rec loop rem cand =
    let l = Set.length cand in
    if (l = 0) then
        []
    else (
        let i = n - l in
        let after = Math.factorial (n - i - 1) in
        let index = rem / (after + 1) in
        let cur = Set.nth cand index 
            |> Option.value_exn
        in
        cur :: (loop (rem - index*after) (Set.remove cand cur))
    )
in
loop 1_000_000 (Set.of_list (module Int) (List.init ~f:Fn.id n)) 
    |> List.map ~f:Int.to_string
    |> String.concat
    |> Printf.printf "%s\n"
;;
