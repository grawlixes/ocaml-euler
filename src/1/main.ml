(** Looking for a way to do this with a filter instead. *)

let rec sol = function
  | 0 -> 0
  | m -> (if m mod 3 = 0 || m mod 5 = 0 
          then m 
          else 0) + sol (m - 1) 

let main () = 
  print_endline (string_of_int (sol 999)) 
;;

main ();;
