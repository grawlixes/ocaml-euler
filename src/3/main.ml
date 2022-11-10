Printf.printf "\n";;

let limit64 = 600851475143L;;

let add64 x y = Int64.add x y;;
let sub64 x y = Int64.sub x y;;
let mul64 x y = Int64.mul x y;;
let div64 x y = Int64.div x y;;
let mod64 x y = Int64.rem x y;;

let rec length = function
    | [] -> 0
    | _ :: t -> (length t) + 1
;;

let divisors l =
    let rec aux acc = function
        | 0L -> acc
        | x  ->
            if (mod64 l x = 0L) then
                if (x = (div64 l x)) then
                    aux (x :: acc) (sub64 x 1L)
                else
                    aux (x :: (div64 l x) :: acc) (sub64 x 1L)
            else
                aux acc (sub64 x 1L)
    in
     let limit = (Int64.to_float l)
    in
     aux [] ((Int64.of_float (Float.sqrt limit)))
;;

(divisors limit64)
    |> List.filter (fun x -> (length (divisors x)) = 2)
    |> List.fold_left (fun x y -> Int64.max x y) 0L
    |> Printf.printf "%Ld\n"
;;
