open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let mx = 
    let map_fun = fun _ _ x -> int_of_string x
    in
    Common.read_matrix 
        "./src/18/input.txt" ' ' map_fun
;;

let rows = Array.length mx;;

(* This doesn't memoize but I'll make a generic
 * function/annotation for that later *)
let rec dfs i j =
    let cur = mx.(i).(j)
    in
    match (i, j) with
        | (r, _) when r = rows - 1 -> 
            cur 
        | (_, _) ->
            let left =
                cur + dfs (i+1) j
            in
            let right =
                cur + dfs (i+1) (j+1)
            in
            max left right
;;

Printf.printf "%d\n" (dfs 0 0);;
