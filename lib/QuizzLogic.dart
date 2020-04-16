import 'package:quizzapp/Question.dart';

class QuizzLogic {

  int _questionIndex = 0;
  
  List<Question> questions = [
    Question(
      flagName: 'argentina.png',
      answer1: 'RD Congo',
      answer2: 'Argentine',
      answer3: 'Australie',
      correctAnswer: 'Argentine'
    ),
  
    Question(
      flagName: 'finland.png',
      answer1: 'Finlande',
      answer2: 'Ouzbekistan',
      answer3: 'Malawi',
      correctAnswer: 'Finlande'
    ),
  
    Question(
      flagName: 'greece.png',
      answer1: 'Grèce',
      answer2: 'Haïti',
      answer3: 'Moldavie',
      correctAnswer: 'Grèce'
    ),
  
    Question(
      flagName: 'senegal.png',
      answer1: 'Russie',
      answer2: 'République du Congo',
      answer3: 'Sénegale',
      correctAnswer: 'Sénegale'
    ),
  
    Question(
      flagName: 'democratic-republic-of-congo.png',
      answer1: 'RD Congo',
      answer2: 'Chilie',
      answer3: 'Portugale',
      correctAnswer: 'RD Congo'
    ),
  
    Question(
      flagName: 'haiti.png',
      answer1: 'RD Congo',
      answer2: 'Haïti',
      answer3: 'Irak',
      correctAnswer: 'Haïti'
    ),
  
    Question(
      flagName: 'namibia.png',
      answer1: 'Nicaragua',
      answer2: 'Nepal',
      answer3: 'Namibie',
      correctAnswer: 'Namibie'
    ),
  
    Question(
      flagName: 'pakistan.png',
      answer1: 'Pakistan',
      answer2: 'Palestine',
      answer3: 'Israel',
      correctAnswer: 'Pakistan'
    ),
  
    Question(
      flagName: 'bahamas.png',
      answer1: 'Croatie',
      answer2: 'Kazakhstan',
      answer3: 'Bahamas',
      correctAnswer: 'Bahamas'
    ),
  
    Question(
      flagName: 'kiribati.png',
      answer1: 'Laos',
      answer2: 'Kiribati',
      answer3: 'Hongrie',
      correctAnswer: 'Kiribati'
    ),
  
    Question(
      flagName: 'sweden.png',
      answer1: 'Equateur',
      answer2: 'Suède',
      answer3: 'Fidji',
      correctAnswer: 'Suède'
    ),
  
    Question(
      flagName: 'gabon.png',
      answer1: 'Gabon',
      answer2: 'France',
      answer3: 'Allemagne',
      correctAnswer: 'Gabon'
    ),
  
    Question(
      flagName: 'bosnia-and-herzegovina.png',
      answer1: 'Norvège',
      answer2: 'Burundi',
      answer3: 'Bosnie-Herzegovine',
      correctAnswer: 'Bosnie-Herzegovine'
    ),
  
    Question(
      flagName: 'romania.png',
      answer1: 'Roumanie',
      answer2: 'Ukraine',
      answer3: 'Côte d\'ivoire',
      correctAnswer: 'Roumanie'
    ),
  
    Question(
      flagName: 'nepal.png',
      answer1: 'Palestine',
      answer2: 'Oman',
      answer3: 'Nepal',
      correctAnswer: 'Nepal'
    ),
  
    Question(
      flagName: 'scotland.png',
      answer1: 'Slovenie',
      answer2: 'République Dominicaine',
      answer3: 'Ecosse',
      correctAnswer: 'Ecosse'
    ),
  
    Question(
      flagName: 'egypt.png',
      answer1: 'Italie',
      answer2: 'Egypte',
      answer3: 'Chypre',
      correctAnswer: 'Egypte'
    ),
  
    Question(
      flagName: 'singapore.png',
      answer1: 'Espagne',
      answer2: 'Sierra Léone',
      answer3: 'Singapour',
      correctAnswer: 'Singapour'
    ),
  
    Question(
      flagName: 'guinea.png',
      answer1: 'Guinée',
      answer2: 'Libye',
      answer3: 'RD Congo',
      correctAnswer: 'Guinée'
    ),
  
    Question(
      flagName: 'uruguay.png',
      answer1: 'Pays de Galles',
      answer2: 'Yemen',
      answer3: 'Uruguay',
      correctAnswer: 'Uruguay'
    ),
  
    Question(
      flagName: 'tajikistan.png',
      answer1: 'Afghanistan',
      answer2: 'Turmenistan',
      answer3: 'Tadjikistan',
      correctAnswer: 'Tadjikistan'
    ),
  
    Question(
      flagName: 'liberia.png',
      answer1: 'Etats Unies d\'Amérique',
      answer2: 'Seychelles',
      answer3: 'Libéria',
      correctAnswer: 'Libéria'
    ),
  
    Question(
      flagName: 'swaziland.png',
      answer1: 'Swazilande',
      answer2: 'Finland',
      answer3: 'Syrie',
      correctAnswer: 'Swazilande'
    ),
  
    Question(
      flagName: 'mongolia.png',
      answer1: 'Mongolie',
      answer2: 'Luxembourg',
      answer3: 'Algérie',
      correctAnswer: 'Mongolie'
    ),
  
    Question(
      flagName: 'germany.png',
      answer1: 'Angleterre',
      answer2: 'Allemagne',
      answer3: 'France',
      correctAnswer: 'Allemagne'
    ),
  
    Question(
      flagName: 'china.png',
      answer1: 'Cuba',
      answer2: 'Chine',
      answer3: 'Italie',
      correctAnswer: 'Chine'
    ),
  
    Question(
      flagName: 'rwanda.png',
      answer1: 'Porto Rico',
      answer2: 'Islande',
      answer3: 'Rwanda',
      correctAnswer: 'Rwanda'
    ),
  
    Question(
      flagName: 'united-states-of-america.png',
      answer1: 'Etats Unies d\'Amérique',
      answer2: 'Chine',
      answer3: 'Russie',
      correctAnswer: 'Etats Unies d\'Amérique'
    ),
  
    Question(
      flagName: 'russia.png',
      answer1: 'Philipines',
      answer2: 'Russie',
      answer3: 'Ukraine',
      correctAnswer: 'Russie'
    ),
  ];

  int getPercent({int numberWin}) {
    return ((numberWin / questions.length) * 100).floor();
  }
  
  String getFlagName() {
    return questions[_questionIndex].flagName;
  }
  
  String getAnswer1() {
    return questions[_questionIndex].answer1;
  }

  String getAnswer2() {
    return questions[_questionIndex].answer2;
  }

  String getAnswer3() {
    return questions[_questionIndex].answer3;
  }
  
  String getCorrectAnswer() {
    return questions[_questionIndex].correctAnswer;
  }
  
  bool isFinished() {
    return this._questionIndex >= questions.length - 1 ? true : false;
  }
  
  void nextQuestion() {
    this._questionIndex++;
  }
  
  void reinitialize() {
    this._questionIndex = 0;
  }
}