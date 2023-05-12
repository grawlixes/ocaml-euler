include Lib;;

Printf.printf "\n";;

(* Solve here *)
let months =
    [|31; 28; 31; 30; 31; 30; 31; 31; 30; 31; 30; 31|]
;;

let isLeapYear y = 
    (y mod 4 = 0) && (not (y mod 100 = 0) || y mod 400 = 0)
;;

(* could be made tail recursive *)
let rec find day month year dow =
    let t = (day, month, year)
    in
    if (t = (0, 0, 2001)) then
        0
    else
        let leapConsider = 
            (month = 1) && (isLeapYear year)
        in
        let nextDay =
            if (day = ((months.(month)) - 1) && (not leapConsider)) || (day, month) = (28, 1) then 0 
            else (day+1)
        in
        let nextMonth =
            if (day = ((months.(month)) - 1) && (not leapConsider)) || (day, month) = (28 ,1) then ((month + 1) mod 12) 
            else month
        in
        let nextYear =
            if (day, month) = (30, 11) then (year+1)
            else year
        in
        let add =
            if (dow = 0 && day = 0) then 1
            else 0
        in
        (find nextDay nextMonth nextYear ((dow + 1) mod 7)) + add
;;

Printf.printf "%d\n" (find 0 0 1901 2);;
