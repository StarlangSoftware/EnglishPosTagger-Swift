//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.09.2020.
//

import Foundation
import Hmm
import Dictionary
import Corpus

public class HmmPosTagger : PosTagger{
    
    private var __hmm: Hmm1<String, Word>? = nil

    /**
    Train method for the Hmm pos tagger. The algorithm trains an Hmm from the corpus, where corpus constitutes
    as an observation array.

    - Parameter corpus : Training data for the tagger.
    */
    public override func train(corpus: PosTaggedCorpus){
        var emittedSymbols : [[String]] = []
        for i in 0..<corpus.sentenceCount(){
            emittedSymbols.append([])
            for j in 0..<corpus.getSentence(index: i).wordCount(){
                let word = corpus.getSentence(index: i).getWord(index: j)
                if word is PosTaggedWord{
                    emittedSymbols[i].append((word as! PosTaggedWord).getTag())
                }
            }
        }
        self.__hmm = Hmm1(states: corpus.getTagList(), observations: emittedSymbols, emittedSymbols: corpus.getAllWordsAsList())
    }

    /**
    Test method for the Hmm pos tagger. For each sentence, the method uses the viterbi algorithm to produce the
    most possible state sequence for the given sentence.

    - Parameter sentence : Sentence to be tagged.

    - Returns: Annotated (tagged) sentence.
    */
    public override func posTag(sentence: Sentence) -> Sentence{
        let result = Sentence()
        let tagList = self.__hmm!.viterbi(s: sentence.getWords())
        for i in 0..<sentence.wordCount(){
            result.addWord(word: PosTaggedWord(name: sentence.getWord(index: i).getName(), tag: tagList[i]))
        }
        return result
    }

}
