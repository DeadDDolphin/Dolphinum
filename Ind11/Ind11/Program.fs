// Learn more about F# at http://fsharp.org
// See the 'F# Tutorial' project for more help.
open System.Windows.Forms
open System. Drawing

let myForm = new Form(Width= 1000, Height = 600, Text = "Индивидуальное задание, 8-й вариант", Menu = new MainMenu())

let placeToInput = new TextBox(Width= 150)

placeToInput.Location <- new Point( 200, 200)
myForm.Controls.Add(placeToInput)

let myCreatingList = new RichTextBox(Width = 150,Height = 400)
myCreatingList.Location <- new Point(700,100)
myForm.Controls.Add(myCreatingList)

let myButton = new Button(Width= 140, Height = 60,Text = "Он сказал поехали, \nон взмахнул рукой!")
myButton.Location <- new Point( 450, 350)
myForm.Controls.Add(myButton)
    

let _ = myButton.Click.Add(fun evArgs ->myCreatingList.AppendText("♥"+placeToInput.Text+"\n"))
// Запускаем форму
do Application.Run(myForm)


[<EntryPoint>]
let main argv = 
    printfn "%A" argv
    0 // return an integer exit code
