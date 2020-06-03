open System.Math;

let rec sumDeg x s =
    if x<0 then s
    else (sumDeg (x/10) (s+Math.Pow(x%10,5)))

let rec sumChisel f x s=
    if x>50000 then s
    else if (f x 0) = x then (sumChisel f (x+1) (s+x))
         else (sumChisel f (x+1) s)

[<EntryPoint>]
let main argv =
    let sum = (sumChisel sumDeg 2 0)
    System.Console.WriteLine(sum);
    0 // return an integer exit code
