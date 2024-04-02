//
//  main.swift
//  Caesar Cipher
//
//  Created by AKMAL RAJ on 2/4/24.
//

import Foundation

let chars = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

print("Option:\n1.Encrypt\n2.Decrypt")

let opt = readLine() ?? "";

if opt.isEmpty {
    print("Please choose an option!")
}

let selectedOption = Int(opt)

if selectedOption != nil {
    switch selectedOption {
    case 1:
        encrypt()
        break
    case 2:
        decrypt()
        break
    default:
        print("Invalid option selected")
    }
}else{
    print("Invalid option selected")
}

func encrypt(){
    print("Type the text to encrypt:")
    fflush(stdout)
    
    let inp = readLine() ?? "";
    
    let seedInt = 1

    if inp.isEmpty {
        print("Empty input")
        exit(0)
    }
    var encryptedText = "";

    for i in 0...(inp.count-1){
        let idx = String.Index(utf16Offset: i, in: inp)
        let str = String(inp[idx])
        
        if chars.contains(str){
            let index = chars.firstIndex(of: str)
            
            if index != nil {
                let indexValue = index!
                if (indexValue + seedInt) < chars.count{
                    let shiftedIdx = chars.index(chars.startIndex, offsetBy: indexValue + seedInt, limitedBy: chars.endIndex)
                    let shiftedChar = chars[shiftedIdx!]
                    encryptedText += shiftedChar
                }else{
                    let unchangeChar = chars[index!]
                    encryptedText += unchangeChar
                }
            }
        }else{
            encryptedText += str
        }
    }

    print("Enrypted text is: \(encryptedText)")

}


func decrypt(){
    print("Type the text to decrypt:")
    fflush(stdout)
    
    let inp = readLine() ?? "";
    
    let seedInt = 1

    if inp.isEmpty {
        print("Empty input")
        exit(0)
    }
    var decryptedText = "";

    for i in 0...(inp.count-1){
        let idx = String.Index(utf16Offset: i, in: inp)
        let str = String(inp[idx])
        
        if chars.contains(str){
            let index = chars.firstIndex(of: str)
            
            if index != nil {
                let indexValue = index!
                if (indexValue - seedInt) > chars.startIndex{
                    let shiftedIdx = chars.index(chars.startIndex, offsetBy: indexValue - seedInt, limitedBy: chars.endIndex)
                    let shiftedChar = chars[shiftedIdx!]
                    decryptedText += shiftedChar
                }else{
                    let unchangeChar = chars[index!]
                    decryptedText += unchangeChar
                }
            }
        }else{
            decryptedText += str
        }
    }

    print("Derypted text is: \(decryptedText)")

}
