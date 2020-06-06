let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

let non_del X Y = 
    if X % Y =0   then false
                  else true

let rec pros X Y =
        if X=Y then true
        else (non_del X Y) && (pros X (Y+1))

let pr n = 
    match n with
    | 2 -> true
    | _ -> pros n 2 

let SAP list = 
    let rec sredAryphPr list i s = function
         [] -> if s = 0 then 0 else (s/i)
         |h::t -> if(pr h) then sredAryphPr t (i+1) (s+h) t
                   else sredAryphPr t i s t
    sredAryphPr list 0 0 list

let SANP list =
    let sred = SAP list
    let rec sredAryphNotPr list i s = function
        [] -> if s = 0 then 0 else s/i
        |h::t -> if(pr h = false && h>sred)
                   then sredAryphNotPr t (i+1) (s+h) t
                 else sredAryphNotPr t i s t
    sredAryphNotPr list 0 0 list



[<EntryPoint>]
let main argv = 
    read_data|>SANP|>printfn "%A"
    System.Console.ReadKey()
    0 // return an integer exit code
