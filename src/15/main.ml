open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(* 2D array dp *)
let size = 20;;

let dp = Array.init (size+1) ~f:(fun _ -> 
    Array.init (size+1) ~f:(fun _ -> 0)
);;

let rec dfs i j =
    if (i = size && j = size) then
        1
    else if max i j > size then 
        0
    else if dp.(i).(j) > 0 then
        dp.(i).(j)
    else (
        dp.(i).(j) <- ((dfs (i+1) j) + (dfs i (j+1)));
        dp.(i).(j)
    )
;;

Printf.printf "%d\n" (dfs 0 0);;
