//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 13.09.2020.
//

import Foundation
import Corpus
import DataStructure

public class PosTaggedCorpus: Corpus {
    
    private var __tagList: CounterHashMap<String>

    /**
     * A constructor of {@link PosTaggedCorpus} which initializes the sentences of the corpus, the word list of
     * the corpus, and all possible tags.
     */
    public override init(){
        self.__tagList = CounterHashMap()
        super.init()
    }
    
    /**
    A constructor of PosTaggedCorpus which initializes the sentences of the corpus, the word list of
    the corpus, and all possible tags.

    - Parameter fileName : Name of the corpus file.
    */
    public override init(fileName: String){
        self.__tagList = CounterHashMap()
        super.init()
        self.fileName = fileName
        var newSentence : Sentence = Sentence()
        var shortTag : String
        let url = Bundle.module.url(forResource: fileName, withExtension: "txt")
        do{
            let fileContent = try String(contentsOf: url!, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                let wordList = line.components(separatedBy: CharacterSet(charactersIn: "\t\n "))
                for word in wordList{
                    if word.count > 0 && String(word).contains("/"){
                        let name = String(word[..<word.lastIndex(of: "/")!])
                        let tag = String(word[word.index(after: word.lastIndex(of: "/")!)...])
                        if tag.contains("+"){
                            shortTag = String(tag[..<tag.firstIndex(of: "+")!])
                        } else if tag.contains("-"){
                            shortTag = String(tag[..<tag.firstIndex(of: "-")!])
                        } else {
                            shortTag = tag
                        }
                        self.__tagList.put(key: shortTag)
                        newSentence.addWord(word: PosTaggedWord(name: name, tag: shortTag))
                        if tag == "."{
                            self.addSentence(s: newSentence)
                            newSentence = Sentence()
                        }
                    }
                }
                if newSentence.wordCount() > 0{
                    self.addSentence(s: newSentence)
                }
            }
        } catch {
        }
    }
    
    /**
    getTagList returns all possible tags as a set.

    - Returns: Set of all possible tags.
    */
    public func getTagList() -> Set<String>{
        return Set(self.__tagList.keys())
    }

}
