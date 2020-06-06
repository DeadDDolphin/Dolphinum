let rec read_list n = 
    if n=0 then []
    else
    let Head = System.Convert.ToInt32(System.Console.ReadLine())
    let Tail = read_list (n-1)
    Head::Tail

let read_data = 
    let n=System.Convert.ToInt32(System.Console.ReadLine())
    read_list n

//функция, которая содает списко чисел от 0 до 9
let getCiferList =[for i in 0..9 -> i]

let rec getCifraCountEl cifra el = 0

let getCifraCount cifer list = List.fold (fun acc el -> acc+(getCifraCountEl cifer el)) 0 list
//функция строит список длины 10 с количеством вхождений цифр в списке
let getCiferCount list ciferList =
    List.map (fun elem -> getCifraCount elem list) ciferList

//let ciferInNum c x=
//    let rec lalal c x k= 
//        if c = 0 then k 
//        else
//             if c%10 = x then lalal (c/10) x (k+1)
//             else lalal (c/10) x k
//    lalal c x 0

//let rec builNewList list c = 
//    let newList = List.map(fun x -> ciferInNum c x) list
//    builNewList list (c+1)

//let sredn s i = s/i
//let getCiferList ciferList list =
//    let rec getCifer ciferList list nList f resList=
//        match list with
//        |h::t -> let rec g q nList= 
//                   g (h/10) list.nth ciferList (h%10+1)::nList
//                 match nList with
//                 |h::t -> if h>4 then sredn s+h i+1 else sredn s i
//                 |[] -> (s/i)::resList
//    getCifer ciferList list [] sredn []

[<EntryPoint>]
let main argv = 
    printfn "%A" argv
    0 // return an integer exit code
