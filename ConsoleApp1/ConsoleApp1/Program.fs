﻿let fiveDeg x = x*x*x*x*x

let rec sumDeg f x s =
    if x<1 then s
    else (sumDeg f (x/10) (s+(f (x%10))))
 
let summa f g =
    let rec sumChisel f g x s =
        if x>50000 then s
        else if (f g x 0) = x then (sumChisel f g (x+1) (s+x))
            else (sumChisel f g (x+1) s)
    sumChisel f g 2 0

[<EntryPoint>]
let main argv =
    let sum = summa sumDeg fiveDeg
    System.Console.WriteLine("Сумма: "+ System.Convert.ToString(sum));
    0 // return an integer exit code