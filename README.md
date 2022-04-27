Pos Tagging
============

This is a tool meant for tagging words with their part-of-speech, a grammatical category based on their function within a sentence, such as noun, adjective, verb, and so forth. 

Video Lectures
============

[<img src="https://github.com/StarlangSoftware/EnglishPosTagger/blob/master/video1.jpg" width="50%">](https://youtu.be/gQmc7Nhwhuk)[<img src="https://github.com/StarlangSoftware/EnglishPosTagger/blob/master/video2.jpg" width="50%">](https://youtu.be/GHUib73MRks)

For Developers
============
You can also see [Java](https://github.com/starlangsoftware/EnglishPosTagger), [Python](https://github.com/starlangsoftware/EnglishPosTagger-Py), [Cython](https://github.com/starlangsoftware/EnglishPosTagger-Cy), [C#](https://github.com/starlangsoftware/EnglishPosTagger-CS), [Js](https://github.com/starlangsoftware/EnglishPosTagger-Js), or [C++](https://github.com/starlangsoftware/EnglishPosTagger-CPP) repository.

## Requirements

* Xcode Editor
* [Git](#git)

### Git

Install the [latest version of Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

## Download Code

In order to work on code, create a fork from GitHub page. 
Use Git for cloning the code to your local or below line for Ubuntu:

	git clone <your-fork-git-link>

A directory called EnglishPosTagger-Swift will be created. Or you can use below link for exploring the code:

	git clone https://github.com/starlangsoftware/EnglishPosTagger-Swift.git

## Open project with XCode

To import projects from Git with version control:

* XCode IDE, select Clone an Existing Project.

* In the Import window, paste github URL.

* Click Clone.

Result: The imported project is listed in the Project Explorer view and files are loaded.


## Compile

**From IDE**

After being done with the downloading and opening project, select **Build** option from **Product** menu. After compilation process, user can run EnglishPosTagger-Swift.

Detailed Description
============

+ [PosTagger](#postagger)

## PosTagger

To train the PosTagger which is used for English pos tagging 

	func train(corpus: PosTaggedCorpus)
	
To tag a sentence, using a newly trained or loaded PosTagger model

	func posTag(sentence: Sentence) -> Sentence
	

3 different PosTagger models are supported:
The one that is used to tag the sentences with a random tag

	DummyPosTagger
	
the one that tags the word with the most used tag for a given word 

	NaivePosTagger
	
the one that does an Hmm based training and tags the words accordingly 

	HmmPosTagger
