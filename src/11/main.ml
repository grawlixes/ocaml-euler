open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let s = 
    (In_channel.read_all "./src/11/input.txt")
;;

let size = 20 * 20;;

(* a is a 1D array of numbers representing the grid *)
let a = 
    (String.split_on_chars ~on:[' '; '\n'] s)
        |> List.filter ~f:(fun s -> (String.length s) > 0)
        |> List.map ~f:(fun s -> int_of_string s)
        |> Array.of_list
;;


(* Compare these shapes to cover all cases
 * 
 *        x      x       x
 * xxxx    x     x      x
 *          x    x     x
 *           x   x    x
 *
 * I could have also used Common.generate_pairs
 * and accessed the elements as (i, j) but this is fine
 *)
(Sequence.range 0 size) 
    |> Sequence.map ~f:
        (fun i ->
            let horiz =
                if (i < size - 3) then
                    a.(i) * a.(i+1) * a.(i+2) * a.(i+3)
                else
                    0
             in
             let diag =
                 if (i < size - 63) then
                     a.(i) * a.(i+21) * a.(i+42) * a.(i+63)
                 else
                     0
             in
             let vert =
                 if (i < size - 60) then
                     a.(i) * a.(i+20) * a.(i+40) * a.(i+60)
                 else
                     0
             in
             let diag2 =
                 if ((i < size - 60) && 
                     (i mod 20) >= 3) then
                    a.(i) * a.(i+19) * a.(i+38) * a.(i+57)
                 else
                    0
             in
              max (max horiz diag) (max vert diag2)
        )
    |> Sequence.fold ~f:(fun acc x -> max acc x) ~init:0
    |> Printf.printf "%d\n"
;;
