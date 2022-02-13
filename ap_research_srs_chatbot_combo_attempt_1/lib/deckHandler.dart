import 'package:ap_research_srs_chatbot_combo_attempt_1/vocabWord.dart';

class DeckHandler {
  //declerations
  //holds all reviews that currently need to be done
  var currentReviews = [];
  //holds all reviews that you need to wait to complete
  var pendingReviews = [];

  //constructor, it's kinda unclear if you actually need this consttruector and itmay also be problicmatic or it just does nothing i'm not sure or it helps
  DeckHandler();

  //adds a word to the deck
  addWord(var theWord) {
    currentReviews.add(VocabWord(theWord, DateTime.now()));
  }

  //should pass in an int holding the current value starting at 0 of the element who's array you'd like to switch
  reviewed(int currentLocation) {
    pendingReviews.add(currentReviews[currentLocation]);
    currentReviews.remove(currentReviews[currentLocation]);
  }

  //this might actually be better of being implemntend in another class
  //checks all elements in pendingReings and compares their last checked time against the next tieme they hsould be checked based off of their currentInterval
  receantReviewsCheck() {}
}
