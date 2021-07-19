import 'dart:io';
import 'dart:math';

main() {
  Solution obj = new Solution();
  obj.analyzeFile();
  obj.calculateLineWithHighestFrequency();
  obj.printHighestWordFrequencyAcrossLines();
}

class Solution {
  List<Line> linesObj = [];
  int maxWordFrequencyAcrossLines = 0;
  List<Line> mostFrequentWordsAcrossLines = [];

  void analyzeFile() {
    List<String> lines = File('file.txt').readAsStringSync().split('\n');
    int lineNumber = 0;

    lines.forEach((line) => linesObj.add(Line(line, lineNumber++)));
  }

  void calculateLineWithHighestFrequency() {
    linesObj.forEach((line) {
      if (line.maxWordFrequency > maxWordFrequencyAcrossLines) {
        maxWordFrequencyAcrossLines = line.maxWordFrequency;
      }
    });
    linesObj.forEach((line) {
      if (line.maxWordFrequency == maxWordFrequencyAcrossLines) {
        mostFrequentWordsAcrossLines.add(line);
      }
    });
  }

  void printHighestWordFrequencyAcrossLines() {
    print('The following words have the highest word frequency per line:');
    mostFrequentWordsAcrossLines.forEach((line) => print(
        '${line.mostFrequentWords} (appears in line ${line.lineNumber})'));
  }
}

class Line {
  String line;
  int lineNumber;
  int maxWordFrequency = 0;
  List<String> mostFrequentWords = [];

  Line(this.line, this.lineNumber) {
    calculateWordFrequency();
  }

  void calculateWordFrequency() {
    List<String> words = line.toLowerCase().split(' ');
    Map<String, int> wordsFrequencyMap = {};

    for (String word in words) {
      if (wordsFrequencyMap.containsKey(word)) {
        wordsFrequencyMap[word] = (wordsFrequencyMap[word] as int) + 1;
      } else {
        wordsFrequencyMap[word] = 0;
      }
    }
    maxWordFrequency = wordsFrequencyMap.values.reduce(max);
    wordsFrequencyMap.forEach((key, value) {
      if (value == maxWordFrequency) {
        mostFrequentWords.add(key);
      }
    });
  }
}
