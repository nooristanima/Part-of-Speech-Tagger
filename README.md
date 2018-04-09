# Part-of-Speech-Tagger

POS Tagger trains program using pos-train.txt which is an excerpt from The Penn Treebank. The Penn Treebank, in its eight years of operation (1989-1996), produced approximately 7 million words of part-of-speech tagged text, 3 million words of skeletally parsed text, over 2 million words of text parsed for predicateargument structure, and 1.6 million words of transcribed spoken text annotated for speech disfluencies.

The tagger.pl program can be executed on any plain text document. The trained algorithm will tag each known word with its most likely part-of-speech. 

Sample run: perl tagger.pl pos-train.txt pos-test.txt 

This command will execute arg 0, tagger.pl, to train on arg 1, pos-train.txt, and execute the algorithm on arg 2, pos-test.txt.

Additionally, the command can be executed as: perl tagger.pl pos-train.txt pos-test.txt >> test.txt

This command executes similiarly to the previous sample run, but the output will be saved in a test.txt file in the local directory.
