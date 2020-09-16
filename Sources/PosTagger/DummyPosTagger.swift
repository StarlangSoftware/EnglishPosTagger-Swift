//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.09.2020.
//

import Foundation
import Corpus

public class DummyPosTagger : PosTagger{
    
    private var __tagList: [String] = []

    public override func train(corpus: PosTaggedCorpus){
        let corpusTagList = corpus.getTagList()
        self.__tagList = Array(corpusTagList)
    }

    /**
    Test method for the Dummy pos tagger. For each word, the method chooses randomly a tag from all possible
    tag list.

    - Parameter sentence : Sentence to be tagged.

    - Returns: Annotated (tagged) sentence.
    */
    public override func posTag(sentence: Sentence) -> Sentence{
        let result = Sentence()
        for i in 0..<sentence.wordCount(){
            let index = Int.random(in: 0..<self.__tagList.count)
            result.addWord(word: PosTaggedWord(name: sentence.getWord(index: i).getName(), tag: self.__tagList[index]))
        }
        return result
    }

}
