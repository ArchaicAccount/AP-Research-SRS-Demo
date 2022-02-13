class VocabWord {
  //declerations
  var word;
  int currentInterval = 0;
  var lastRecallDate;

  //constructor
  VocabWord(this.word, this.lastRecallDate);

  //updates the current interval of the word based off weather or not the answer was correct
  //correct should be weather or not the question was answer correctly
  updateInterval(bool correct) {
    if (correct) {
      currentInterval++;
      updateRecallDate();
    } else {
      currentInterval = 0;
    }
  }

  //returns the word value of the current object, idk why I need this I shouldn't but the code wasn't workign useing the normal x.word method so i guess it stays...
  getWord() {
    return word;
  }

  //returns how long ago the last recall was in # of days (int)
  daysSinceLastRecall() {
    var x = DateTime.now().difference(lastRecallDate);
    return x.inDays;
  }

  //updates the last recall date to the current date
  updateRecallDate() {
    lastRecallDate = DateTime.now();
  }
}
