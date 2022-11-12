let rec pow a = function
  | 0 -> 1
  | 1 -> a
  | n ->
    let b = pow a (n / 2) in
    b * b * (if n mod 2 = 0 then 1 else a)
;;

let rec gcd a b =
    if (b = 0) then a
    else gcd b (a mod b)
;;

let lcm a b = (a * b) / (gcd a b);;
