open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let ones = Array.of_list
    [0; 3; 3; 5; 4; 4; 3; 5; 5; 4]
;;
let tens = Array.of_list
    [0; 3; 6; 6; 5; 5; 5; 7; 6; 6]
;;
let teens = Array.of_list
    [3; 6; 6; 8; 8; 7; 7; 9; 8; 8]
;;

let hundred = 7;;
let and_cost = 3;;

let rec count n = 
    match n with
        | x when x < 10 -> 
            ones.(x)
        | x when x < 20 ->
            teens.(x - 10)
        | x when x < 100 ->
            tens.(x / 10) + (count (n mod 10))
        | x -> 
            let mod_val = x mod 100
            in
            ones.(x / 100) + hundred + (
                if (mod_val > 0) then
                    and_cost
                else
                    0
            ) + (count mod_val)
in
(Sequence.range 1 1000) 
    |> Sequence.map ~f:(fun i -> count i)
    |> Sequence.fold ~f:(fun acc x -> acc + x) ~init:0
    |> fun sum -> sum + 11 (* one thousand *)
    |> Printf.printf "%d\n"
;;
