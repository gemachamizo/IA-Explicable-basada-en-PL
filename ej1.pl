 % Directive

 % rule_8
 has_right(Article, PersonId, Right, Matter, directive_2016_800) :- directive_applies(PersonId), has_right(Article, PersonId, Right, Matter).

 % rule_7
 directive_applies(PersonId) :-  person_status(PersonId, child).

 % rule_6
 person_status(PersonId, child) :- user_fact(person_age(PersonId, X)), X < 18.

 person_status(PersonId, adult) :- user_fact(person_age(PersonId, X)), X >= 18.

 % rule_9
 has_right(article15_1, PersonId, right_to_be_accompanied, HolderId) :-
  user_fact(person_status(HolderId, holder_of_parental_responsibility)),
  user_fact(proceeding_status(PersonId, started)),
  user_fact(proceeding_matter(PersonId, court_hearing)).

 % Polish implementation

 law_applies(article1_2, PersonId) := 
  user_fact(proceeding_type(PersonId, criminal)),
  user_fact(person_age(PersonId, X)),
  X > 13, X < 17.

 % rule_5
 person_status(PersonId, adult) :=
  user_fact(person_age(PersonId, X)), X >= 17.

 person_status(PersonId, minor) :=
  law_applies(article1_1, PersonId).

 has_right(article32f, PersonId, right_to_be_accompanied, HolderId) :=
  person_status(PersonId, minor),
  user_fact(person_status(HolderId, holder_of_parental_responsibility)).

 % Facts

 r1: user_fact(person_age(nino, 17)). % rule_1
 user_fact(person_status(alf, holder_of_parental_responsibility)). % rule_2
 user_fact(proceeding_matter(nino, court_hearing)). % rule_3
 user_fact(proceeding_status(nino, started)). % rule_4

 % Conflict

 conflict([person_status(PersonId, child)], [person_status(PersonId, adult)]).
 conflict([person_status(PersonId, adult)], [person_status(PersonId, child)]).
