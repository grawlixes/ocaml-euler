open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(Common.generate_pairs 1 1001 1)
    |> List.filter ~f:(fun (a,b) -> 
        let c = (1000 - (a + b)) in
        (c > 0) && ((Math.pow a 2) + (Math.pow b 2) = (Math.pow c 2)))
    |> function 
        | [] -> Printf.printf "Error: empty list.\n"
        | ((a, b) :: _) -> 
            let c = (1000 - (a + b)) in
            Printf.printf "%i\n" (a*b*c)
;;
