(** Looking for a way to do this with a filter instead. *)

let rec sol x = function
  | y -> (if y > 4_000_000 then 
            0 
          else
            ((sol y (x+y)) + (if y mod 2 = 1 then 0 else y))
  );;

print_endline (string_of_int (sol 0 1));;
