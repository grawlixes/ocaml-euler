Printf.printf "\n";;

let fibBelow4Mil = 
    let rec aux acc a = function
        | b -> (if (b > 4_000_000) then
                    acc
                else
                    aux ((a + b) :: acc) b (a+b))
    in
    aux [1; 0] 0 1
;;

(* Get all fibonacci numbers below 4 million,
 * then filter out the odds,
 * then sum each remaining number,
 * then print the sum*)
fibBelow4Mil
    |> List.filter (fun n -> n mod 2 = 0)
    |> List.fold_left (fun x y -> x + y) 0 
    |> Printf.printf "%d\n"
;;

(* original way that i did it 
let rec sol x = function
  | y -> (if y > 4_000_000 then 
            0 
          else
            ((sol y (x+y)) + (if y mod 2 = 1 then 0 else y))
  );;

 print_endline (string_of_int (sol 0 1));; *)
