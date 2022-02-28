import 'package:ap_research_srs_chatbot_combo_attempt_1/vocabWord.dart';
import 'dart:math';

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
    currentReviews.add(VocabWord(theWord, DateTime.now(), 0));
  }

  practiceWordGen() {
    currentReviews.add(
        VocabWord("monkey", DateTime.utc(2022, 1, 26), 3)); //27 or somthing
    currentReviews
        .add(VocabWord("dog", DateTime.utc(2022, 2, 10), 2)); //17 or somthing
    currentReviews
        .add(VocabWord("computer", DateTime.utc(1944, 6, 6), 1)); //alot
  }

  //should pass in an int holding the current value starting at 0 of the element who's array you'd like to switch
  reviewed(int currentLocation) {
    //please uncomment this before actually shipping it literarlly is completly integral to the code workign but it messes with testing
    // currentReviews[currentLocation].updateInterval(true);
    pendingReviews.add(currentReviews[currentLocation]);
    currentReviews.remove(currentReviews[currentLocation]);
    //maybe add something that chains getNextReview here later
  }

  //this might actually be better of being implemntend in another class
  //checks an elemant in pendingReings and compares their last checked time against the next tieme they hsould be checked based off of their currentInterval

  //above comment is incorrect, this now checks if the word is beyond its current time interval and if it is moves it from the peningreivews to current reviews list
  recentReviewsCheck() {
    //def might be somthing wrong with this sorting alg, further testing required
    for (int i = 0; i < pendingReviews.length; i++) {
      print(pendingReviews[i].currentInterval.toString() +
          "dayssince" +
          pendingReviews[i].word.toString());

      if (pendingReviews[i].daysSinceLastRecall() >=
          timeIntervals[pendingReviews[i].currentInterval]) {
        currentReviews.add(pendingReviews[i]);
        pendingReviews.removeAt(i);
        i--;
      }
    }
  }

  //choses a random word from the list of current reviewable words
  getNextReview() {
    Random R = new Random();

    return currentReviews[R.nextInt(currentReviews.length)].word;
  }
}
