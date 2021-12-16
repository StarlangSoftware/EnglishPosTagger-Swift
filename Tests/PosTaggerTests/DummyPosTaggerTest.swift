import XCTest
@testable import PosTagger

final class DummyPosTaggerTest: XCTestCase {
    
    func testPosTag() {
        let posTagger = DummyPosTagger()
        let posTaggedCorpus = PosTaggedCorpus(fileName: "brown")
        posTagger.train(corpus: posTaggedCorpus)
        var correct : Int = 0
        var incorrect : Int = 0
        for i in 0..<posTaggedCorpus.sentenceCount(){
            let taggedSentence = posTagger.posTag(sentence: posTaggedCorpus.getSentence(index: i))
            for j in 0..<taggedSentence.wordCount(){
                if ((posTaggedCorpus.getSentence(index: i).getWord(index: j)) as! PosTaggedWord).getTag() == (taggedSentence.getWord(index: j) as! PosTaggedWord).getTag(){
                    correct = correct + 1
                } else {
                    incorrect = incorrect + 1
                }
            }
        }
        XCTAssertEqual(0.88, Double(100 * correct) / Double((correct + incorrect)), accuracy: 0.01)
    }

    static var allTests = [
        ("testExample", testPosTag),
    ]
}
