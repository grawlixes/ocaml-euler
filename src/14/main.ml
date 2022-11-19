open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

(* Trying it with an array instead to speed it up.
 * It's way faster, .15 seconds instead of the 3 below *)
let dp = ref (Array.init 1_000_001 ~f:(fun _ -> 0))
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
            if (n <= 1_000_000 && (Array.get !dp n) = 0) then
                Array.set !dp n ((collatz nxt) + 1);
            
            if (n <= 1_000_000) then
                Array.get !dp n
            else
                collatz nxt + 1
in
(Sequence.range 1 1_000_000)
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
    


(* this works, but takes forever probably because I'm
 * doing something wrong. my runtime is 3 seconds
 * I could have used an array but I wanted to 
 * try learning the hash table library, I'll need
 * more practice to use it efficiently

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
            Printf.printf "%d\n" n;
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
   *) 
