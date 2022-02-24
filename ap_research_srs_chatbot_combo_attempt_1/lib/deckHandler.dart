import 'package:ap_research_srs_chatbot_combo_attempt_1/vocabWord.dart';

class DeckHandler {
  //declerations
  //holds all reviews that currently need to be done
  var currentReviews = [];
  //holds all reviews that you need to wait to complete
  var pendingReviews = [];
  //temp numbers for testing that need to be replaced with some avg numbers
  var timeIntervals = [0, 5, 20, 100];

  //constructor, it's kinda unclear if you actually need this consttruector and itmay also be problicmatic or it just does nothing i'm not sure or it helps
  DeckHandler();

  //adds a word to the deck
  addWord(var theWord) {
    currentReviews.add(VocabWord(theWord, DateTime.now()));
  }

  practiceWordGen() {
    currentReviews
        .add(VocabWord("monkey", DateTime.utc(2022, 1, 26))); //27 or somthing
    currentReviews
        .add(VocabWord("dog", DateTime.utc(2022, 2, 6))); //17 or somthing
    currentReviews.add(VocabWord("computer", DateTime.utc(1944, 6, 6))); //alot
  }

  //should pass in an int holding the current value starting at 0 of the element who's array you'd like to switch
  reviewed(int currentLocation) {
    currentReviews[currentLocation].updateInterval(true);
    pendingReviews.add(currentReviews[currentLocation]);
    currentReviews.remove(currentReviews[currentLocation]);
  }

  //this might actually be better of being implemntend in another class
  //checks an elemant in pendingReings and compares their last checked time against the next tieme they hsould be checked based off of their currentInterval

  //above comment is incorrect, this now checks if the word is beyond its current time interval and if it is moves it from the peningreivews to current reviews list
  recentReviewsCheck() {
    //just for testing, remove when done
    print("presort:");
    for (int i = 0; i < pendingReviews.length; i++) {
      print(pendingReviews[i].word);
    }
    for (int i = 0; i < currentReviews.length; i++) {
      print(currentReviews[i].word);
    }

    //def might be somthing wrong with this sorting alg, further testing required
    for (int i = 0; i < pendingReviews.length; i++) {
      if (pendingReviews[i].daysSinceLastRecall() >=
          timeIntervals[pendingReviews[i].currentInterval]) {
        currentReviews.add(pendingReviews[i]);
        pendingReviews.removeAt(i);
      }
    }

    //just for testing, remove when done
    print("postsort:");
    for (int i = 0; i < pendingReviews.length; i++) {
      print(pendingReviews[i].word);
    }
    for (int i = 0; i < currentReviews.length; i++) {
      print(currentReviews[i].word);
    }
  }
}
