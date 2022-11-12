(* Get length of list l *)
let rec length = function
    | []     -> 0
    | _ :: t -> 1 + (length t)
;;

(* Maps array a according to function f, then flattens *)
let map_and_flatten a f = List.flatten (List.map f a);;

(* Generates a list [i, j) skipping by k *)
let range i j k =
    List.init ((j - i) / k) (fun x -> (k*x + i))
;;

(* Generates pairs (x, y) for x,y in [i, j) 
 * skipping by k *)
let generate_pairs i j k =
  let gen_range = fun x -> (i + x*k) in
  map_and_flatten (List.init ((j - i) / k) gen_range)
    (fun a ->
      map_and_flatten (List.init ((j - i) / k) gen_range)
        (fun b -> [(a, b)])
    )
;;

(* Returns true if all elements in l are true, false otherwise *)
let rec all = function
    | []         -> true
    | false :: _ -> false
    | true :: t  -> all t
;;

(* Returns true if at least one element in l is true, false otherwise *)
let rec any = function
    | []         -> false
    | false :: t -> any t
    | true :: _  -> true
;;
