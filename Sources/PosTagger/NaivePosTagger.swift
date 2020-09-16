//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.09.2020.
//

import Foundation
import DataStructure
import Corpus

public class NaivePosTagger : PosTagger{
    
    private var __maxMap: [String:String] = [:]

    /**
    Train method for the Naive pos tagger. The algorithm gets all possible tag list. Then counts all
    possible tags (with its counts) for each possible word.

    - Parameter corpus : Training data for the tagger.
    */
    public override func train(corpus: PosTaggedCorpus){
        var wordMap : [String:CounterHashMap<String>] = [:]
        for i in 0..<corpus.sentenceCount(){
            let s = corpus.getSentence(index: i)
            for j in 0..<s.wordCount(){
                let word = corpus.getSentence(index: i).getWord(index: j)
                if word is PosTaggedWord{
                    if wordMap[word.getName()] != nil{
                        wordMap[word.getName()]!.put(key: (word as! PosTaggedWord).getTag())
                    } else {
                        let counterMap = CounterHashMap<String>()
                        counterMap.put(key: (word as! PosTaggedWord).getTag())
                        wordMap[word.getName()] = counterMap
                    }
                }
            }
        }
        for word in wordMap.keys{
            self.__maxMap[word] = wordMap[word]!.max()
        }
    }

    /**
    Test method for the Naive pos tagger. For each word, the method chooses the maximum a posterior tag from all
    possible tag list for that word.

    - Parameter sentence : Sentence to be tagged.

    - Returns: Annotated (tagged) sentence.
    */
    public override func posTag(sentence: Sentence) -> Sentence{
        let result = Sentence()
        for i in 0..<sentence.wordCount(){
            result.addWord(word: PosTaggedWord(name: sentence.getWord(index: i).getName(), tag: self.__maxMap[sentence.getWord(index: i).getName()]!))
        }
        return result
    }

}
