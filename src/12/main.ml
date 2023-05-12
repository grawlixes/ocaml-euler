open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(Sequence.unfold_step ~init:(0, 1) 
    ~f:(fun (x, i) -> Yield (x + i, (x + i, i + 1))))
    |> Sequence.drop_while 
        ~f:(fun x ->
            Common.length (Math.divisors x) <= 500
        )
    |> fun seq -> Sequence.nth_exn seq 0
    |> Printf.printf "%d\n"
;;
