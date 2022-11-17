open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(* this works, but takes forever probably because I'm
 * doing something wrong. my runtime is 3 seconds
 * I could have used an array but I wanted to 
 * try learning the hash table library, I'll need
 * more practice to use it efficiently
 *)

let dp = ref (Hashtbl.create (module Int))
in
let rec collatz i =
    match i with
        | 1 -> 1
        | n ->
            let nxt =  
                if (n mod 2 = 0) then
                    n / 2
                else
                    3*n + 1
            in
            if (Option.is_none (Hashtbl.find !dp n)) then
                Hashtbl.add_exn !dp ~key:n ~data:(collatz nxt + 1);
            match (Hashtbl.find !dp n) with
                | None   -> -1
                | Some x -> x
in
(Sequence.range 1 1_000_001)
    |> Sequence.map ~f:(fun i -> (i, collatz i))
    |> Sequence.fold 
        ~f:(fun (im,cm) (i,c) -> 
            if (cm < c) then
                (i,c)
            else
                (im,cm)
        ) 
        ~init:(0,0)
    |> fun (i,_) -> Printf.printf "%d\n" i
;;
