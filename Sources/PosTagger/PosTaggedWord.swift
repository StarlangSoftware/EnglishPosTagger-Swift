//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.09.2020.
//

import Foundation
import Dictionary

public class PosTaggedWord : Word{
    
    private var __tag: String

    /**
    A constructor of PosTaggedWord which takes name and tag as input and sets the corresponding attributes

    - Parameters:
        - name : Name of the word
        - tag : Tag of the word
    */
    public init(name: String, tag: String){
        self.__tag = tag
        super.init(name: name)
    }

    /**
    Accessor method for tag attribute.

    - Returns: Tag of the word.
    */
    public func getTag() -> String{
        return self.__tag
    }

}
