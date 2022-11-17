open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let s = 
    (In_channel.read_all "./src/13/input.txt")
;;

(* Take the first 15 digits of each number, add them
 * together, convert to int, sum, and print the first
 * 10 digits of the sum
 *)
(String.split_on_chars ~on:['\n'] s)
    |> List.filter ~f:(fun s -> String.length s > 0)
    |> List.map 
        ~f:(fun s -> 
            int_of_string (String.sub s ~pos:0 ~len:15)
        )
    |> List.fold ~f:(fun acc x -> acc + x) ~init:0
    (* below we move from a list to a scalar value *)
    |> string_of_int
    |> fun s -> String.sub s ~pos:0 ~len:10
    |> Printf.printf "%s\n"
;;
