class VocabWord {
  //declerations
  var word;
  int currentInterval = 0;
  var lastRecallDate;

  //constructor
  VocabWord(this.word, this.lastRecallDate);

  //updates the current interval of the word based off weather or not the answer was correct
  updateInterval(bool correct) {
    if (correct) {
      currentInterval++;
      updateRecallDate();
    } else {
      currentInterval = 0;
    }
  }

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
    //need to make it so it doesnt just put the whole shitty string
    lastRecallDate = DateTime.now();
  }
}
