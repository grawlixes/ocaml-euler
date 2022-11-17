open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(* This approach is not great because it only gives you
 * elements up to, **not including** one that has >500
 * divisors. So I had to run it, take note of the last
 * element that was printed, increase the limit, and
 * then run it again, taking the element right after
 * the one I took note of.
 *
 * It also revisits the elements after calculating
 * their divisors which is similarly inefficient.
 * I should have used a while loop
 *)
(Sequence.unfold_step ~init:(0, 1) 
    ~f:(fun (x, i) -> Yield (x + i, (x + i, i + 1))))
    |> Sequence.take_while 
        ~f:(fun x -> 
            (Common.length (Math.divisors x)) <= 500
        )
    |> Sequence.iter ~f:(fun x -> Printf.printf "%d\n" x)
;;
