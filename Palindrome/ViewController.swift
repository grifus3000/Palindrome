//
//  ViewController.swift
//  Palindrome
//
//  Created by Grifus on 01.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inpuTextField: UITextField!
    
    @IBOutlet weak var outputTextLable: UILabel!
    
    @IBOutlet weak var outputLenght: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func palindrome(str: String) -> (String, Int) {
        let str = [Character](str)
        var palindrome = ""
        var palLenght = 0
        var leftIndex = 0
        var rightIndex = 0
        for i in 0..<str.count {
            leftIndex = i
            rightIndex = i
            whileMethod(leftIndex: &leftIndex, rightIndex: &rightIndex, s: str, palLenght: &palLenght, palindrome: &palindrome)
            leftIndex = i
            rightIndex = i + 1
            whileMethod(leftIndex: &leftIndex, rightIndex: &rightIndex, s: str, palLenght: &palLenght, palindrome: &palindrome)
        }
        return (palindrome, palLenght)
    }
    
    func whileMethod( leftIndex: inout Int, rightIndex: inout Int, s: [Character], palLenght: inout Int, palindrome: inout String) {
        while leftIndex >= 0 && rightIndex <= s.count - 1 && s[leftIndex] == s[rightIndex] {
            if  palLenght <= rightIndex - leftIndex + 1 {
                palLenght = rightIndex - leftIndex + 1
                palindrome = String(s[leftIndex...rightIndex])
            }
            leftIndex -= 1
            rightIndex += 1
        }
    }
    
    @IBAction func actionButton(_ sender: Any) {
        let out = palindrome(str: inpuTextField.text ?? "")
        outputTextLable.text = out.0
        outputLenght.text = String(out.1)
    }
}

