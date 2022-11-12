open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let is_palindrome s = String.equal s (String.rev s);;

(Common.generate_pairs 100 1000 1)
    |> List.map ~f:(fun (x,y) -> x * y)
    |> List.filter ~f:(fun x -> is_palindrome (string_of_int x))
    |> List.fold_left ~f:(fun x y -> max x y) ~init:0
    |> Printf.printf "%d\n"
;;
