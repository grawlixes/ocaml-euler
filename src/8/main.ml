open Core;;
include Lib;;

Printf.printf "\n";;

(* Solve here *)

let s = 
    (In_channel.read_all "./src/8/input.txt")
        |> String.filter 
            ~f:(fun ch -> not (Char.equal ch '\n'))
;;

let length = 13;;

(* Easier version I came up with after writing the function below. 
 * - Start with a sequence of indices [0, s - (n - 1)]
 * - Map each index to the product of all digits in
 *   range [i, i + n) within the string
 * - Get the max of those elements and print it
 * The optional handling is just required because of
 * the underlying implementation of max_elt, I won't
 * ever actually get an empty sequence *)

(Sequence.range 0 ((String.length s) - length + 1))
    |> Sequence.map 
        ~f:(fun i -> 
            (String.sub ~pos:i ~len:length s)
                |> String.fold 
                    ~f:(fun acc c -> acc * (Common.char_to_int c)) 
                    ~init:1
           )
    |> Sequence.max_elt ~compare:Int.compare
    |> Option.value_exn
    |> Printf.printf "%d\n" 
;;


(* largest product of n adjacent digits in string s 
 * this was my first solution, it was a pain in the ass
 * to write. Probably because I tried writing it like Python *)
let largest s n =
    let rec aux prod zeroes ret = function
        | i when i < (String.length s) ->
            let num = Common.char_to_int (String.get s i) in
            let remove =
                if (i < n) then None
                else Some (Common.char_to_int (String.get s (i-n)))
            in
            let newProd = 
                let div = 
                    (function
                        | None   -> 1
                        | Some x -> 
                            if (x = 0) then 1
                            else x
                    ) remove
                in
                if (num = 0) then prod / div
                else (prod / div) * num
            in
            let newZeroes = 
                let nz = 
                    if ((Option.value remove ~default:(1)) = 0) then (zeroes - 1) 
                    else zeroes
                in
                if (num = 0) then nz + 1
                else nz 
            in
            let newRet =
                if (newZeroes > 0) then ret 
                else max ret newProd
            in
            aux newProd newZeroes newRet (i + 1)
        | _ -> ret
    in
     aux 1 0 0 0
;;

(* Printf.printf "%i\n" (largest s 13);; *)
