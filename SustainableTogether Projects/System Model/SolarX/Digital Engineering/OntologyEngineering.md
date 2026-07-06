# Beyond  Foundations

<||WXb23TXrUn3Rxz00yNNr89HV||><||WXb23TXrUn3Rxz00yNNr89HV||>#### Ontology #### Engineering

In the previous chapters, we have investigated various formalisms for speci-
fying and querying semantic data – or phrased even more boldly: knowledge
– be it on the Web, in some company’s intranet, or elsewhere. We have seen
that those formalisms come with standardized, precisely deﬁned syntax and
formal semantics.
So, knowledgeable about those knowledge representation formalisms and
their grounding in formal logic, we could argue that we are well-equipped and
readily prepared to go about bringing semantics to everybody in need of it.
However, being able to come up with semantic descriptions of toy examples
in some sandbox domain (such as a nut-allergic person consuming an inap-
propriate dish) does not guarantee that real-world modeling tasks (such as
coming up with a comprehensive description of patients, allergies, allergens,
and medical treatments) can be eﬀortlessly tackled in the same way. As an
analogy, imagine the situation of a programmer able to create a “Hello World!”
program faced with the task of producing a desktop publishing system or the
like. It is clear that the sheer size and complexity of real-world modeling tasks
will easily exceed what can be done by an RDF(S) or OWL expert by just
sitting down and creating an ontology document.
This directly brings us to the discipline of *ontology* *engineering* which –
in analogy to software engineering – is concerned with the challenges of de-
signing complex systems (in our case: ontologies) by providing methodologies
and auxiliary tools for their development, evaluation, and maintenance. In
the following sections, we brieﬂy sketch the central topics in ontology engi-
neering. However, note that, as opposed to the formalisms introduced in the
previous chapters, this area is still very much in ﬂux and subject to active
research. Therefore, our review is necessarily preliminary and less detailed,
as it aims at providing just an overview. Furthermore, our choice of which
aspects of ontology engineering to present here is of course very inﬂuenced by
our subjective view of the emerging ﬁeld.
Software engineering has been around for many more years than ontology
engineering and the process of creating software bears some similarities to
designing an ontology (despite the foundational diﬀerence between the oper-
ational vs. declarative paradigm). Hence, it is worthwhile to investigate the
central ideas of this neighboring ﬁeld and see whether they can be transferred.
One of the basic principles in software engineering is the idea of a life cycle,

<||WXb23TXrUn3Rxz00yNNr89HV||>meaning a process model of subsequent, partly intertwined steps for software
development and maintenance. Clearly, the design of large-size and complex
knowledge bases requires a similarly structured approach. In the following
three sections, 8.1, 8.2, and 8.3, we focus on the subtasks of requirement anal-
ysis, ontology creation, and ontology quality assurance which will be further
subdivided.
Thereafter, in Section 8.4, we address the somewhat orthogonal issue of on-
tology modularization which is particularly important for ontology reuse and
collaborative ontology creation as well as for optimizing automated inference.
We ﬁnish the chapter by naming some of the most popular and mature
software tools in the context of ontology engineering.

8 **.1** **Requirement** **Analysis**

As in software engineering, it is immediately clear that a thorough require-
ment analysis is crucial for the development of an ontology that is appropriate
for a given purpose.
In the very ﬁrst place, it should be decided whether a semantic representa-
tion is at all needed or whether an alternative approach (like using a classical
database) would be a better choice. In some cases, this question may already
be subject to heavy controversy, be it because a “non-semantic” solution al-
ready exists or the possibly expensive modeling eﬀort is not accompanied by
an obvious added value. There are essentially two major points in favor of an
ontology-based system: First, the knowledge represented in a semantic format
can be more easily exchanged as well as integrated with knowledge from other
sources. Second, by employing deduction algorithms, the implicit knowledge
following from a semantic speciﬁcation becomes accessible.
Another related question which might be discussed is whether a representa-
tion based on formal logic is reasonable for the intended purpose. We do not
want to discuss one of the early questions of artiﬁcial intelligence: whether
every kind of knowledge can be represented in a symbolic, logical way. Still,
experiments in cognitive science have shown that few people think strictly
logically. ^1^ Therefore, if an application is focused on interhuman knowledge
exchange (possibly using computers only as a communication device) it might
even be better oﬀusing non-logical means of knowledge representation.
Another aspect to be considered at this stage is the available tool support
for the diﬀerent knowledge representation options. This in turn depends on

1 See, e.g., the experiments carried out by P. Wason [Was68]. In a similar way in economics,
the idea of the *homo* *oeconomicus* , a person optimizing its action toward the greatest
ﬁnancial beneﬁt in an entirely rational way, has lately been shown to be a questionable
model of human economical behavior.

<||WXb23TXrUn3Rxz00yNNr89HV||>the purpose of the system to be designed. When reviewing the available tech-
nologies the following criteria should be considered: Will the choice require
the commitment to one speciﬁc tool? What speciﬁc licenses are associated
with the available software? How mature is it? What kind (if any) of support
does the tool vendor oﬀer? Is the tool suﬃciently interoperable with other
tools one might use or want to use?
If the decision to use a semantic, formal-logic-based formalism is made, the
subsequent question is: which one? This again depends on the requirements
of the speciﬁc scenario. If large amounts of data have to be handled and a less
expressive formalism is suﬃcient, RDF(S) might be the right choice. If the
size of the represented information is moderate and more expressive means of
knowledge representation (as well as elaborate support for inferring implicit
knowledge) are desired, OWL DL would be a better recommendation. In the
case of OWL 2, some proﬁles might also be adequate for scenarios situated in
the middle of this spectrum. Again, tool support might be another decision
criterion, likewise the availability of skills in handling those formalisms and
prior experiences.
Once the modeling formalism has been agreed upon, the requirements of
the ontology have to be speciﬁed more precisely by answering the following
questions:

- What domain has to be modeled? What aspects of this domain have tobe captured?

- What is the needed granularity, i.e. the level of detail, of the speciﬁca-tion?

- What are the tasks to be accomplished with the help of the ontology:browsing a body of knowledge, search for information, querying or check-
ing inferences? What kind of inferences are expected or desired?

Depending on the answers to those questions, the domain-speciﬁc primitives
(typically individuals, classes, and roles) and the degree of axiomatization have
to be chosen.

8 **.2** **Ontology** **Creation** **–** **Where** **Is** **Your** **Knowledge?**

As ontologies are meant to specify knowledge about some domain, the pro-
cess of creating an ontology can be seen as transferring knowledge into a
computer-accessible form. Clearly, there are several possible sources of the
knowledge to be formalized. These might be categorized with respect to the
extent to which they are already accessible to computer systems, and, more
precisely, to what extent the structure of the current representation of the

<||WXb23TXrUn3Rxz00yNNr89HV||>provided knowledge can be exploited to facilitate the formalization process
(i.e. the process of making the inherent semantics formally explicit). Based
on that criterion, we distinguish human, unstructured, semi-structured, and
structured sources of knowledge which will be treated in the following sections.
But ﬁrst, one more remark: we might have given the impression that for-
malizing a piece of knowledge is more or less straightforward, provided the
underlying formalism is expressive enough. However, there may be several
ways to model a situation correctly (or better: appropriately for a certain
use); in some cases, it might be not at all clear how to do it. Usually, this
problem becomes especially apparent if comparably abstract terms or situa-
tions are to be modeled. For example, try to come up with a formal deﬁnition
of “game” or “democracy.” Now, one might argue that a formal deﬁnition
of such terms is rather a philosophical than an engineering task. But even
terms that are much more down-to-earth may require serious thought when
they are to be modeled. Consider the term “school” for instance. It may
represent a building, an institution, a body of people. Still all those meanings
are not completely independent but somewhat related, which – linguistically
speaking – qualiﬁes the word “school” as a *polyseme* . Obviously the decision
which of those aspects one should model also depends on the purpose of the
ontology. In our case, an ontology characterizing buildings and their functions
would model the concept “school” very diﬀerently from an ontology describing
a country’s educational system.
In general, akin to software engineering, there is no unique correct way to
build a system satisfying the requirements; sometimes there are some design
decisions to be made. However, certain ways of dealing with certain mod-
eling tasks have proven useful and viable which makes them a reasonable
recommendation in future similar cases. Therefore, in analogy to software
engineering, certain best practices and *modeling* *patterns* have been and are
being established. In this spirit, we provide some methodological guidelines
on ontology creation in Section 8 .3.2.

8 **.2.1** **It’s** **in** **Your** **Heads:** **Human** **Sources**

A rather immediate source of knowledge about a domain of interest is a
person knowledgeable about that domain, a so-called *domain* *expert* . Ideally,
the domain expert is acquainted with the used ontology language and capable
of formalizing his knowledge. However, not in all cases the domain expert is
able to formulate his knowledge in such a way that it can directly be written
down in some knowledge representation formalism. There may be several
reasons for that.
One the one hand, though being a luminary in his ﬁeld of expertise, the
domain expert might be anything but an expert in logic. In particular, he
might be unable to express his knowledge (which might nevertheless be very
clear and formal) by means of one of the representation languages discussed
in this book. In that case, some kind of mediation is needed. A person knowl-

<||WXb23TXrUn3Rxz00yNNr89HV||>edgeable in the representation formalism, often called the *knowledge* *engineer* ,
will conduct interviews with one or more domain experts in order to get hold
of their knowledge. She will interpret the answers (naturally making extensive
use of his background knowledge) and cast them into logical speciﬁcations.
Of course this communication process might lead to information loss or –
even worse – introduce errors, just as misunderstandings frequently arise in
human communication. To reduce the danger of misunderstanding on the
communication level, it is essential to introduce redundancy, feedback, and
double checks in the interview process. For instance the knowledge engineer
should rephrase the knowledge she just formalized in her own words and ask
the domain experts for their conﬁrmation. Therefore besides being an expert
in the used knowledge representation formalisms, a knowledge engineer must
have excellent communication skills.
On the other hand, the expert’s knowledge might not (or not consciously)
be based on clear deﬁnitions or rules. For example, an experienced physician
might be able to identify carcinogenic cells under the microscope without be-
ing capable of giving a clear deﬁnition distinguishing pathological from normal
cells. ^2^ In such cases, one might employ indirect methods: based on a com-
prehensive set of examples that has been classiﬁed by an expert, automated
techniques can be applied to generate logical expressions that characterize the
commonalities of the positive as opposed to the negative examples. Techniques
from machine learning, most notably decision tree learning or inductive logic
programming, can be used to this end (essentially, the generated classiﬁer
must be expressible in the used formalism). Also interactive techniques that
actively ask the expert to classify interesting examples or to conﬁrm or deny
hypothetical axioms exist, for example, techniques from the ﬁeld of formal
concept analysis.
In general, carefully designed tools for knowledge authoring might alleviate
the task of specifying knowledge. With appropriate interaction paradigms, it
is possible to “hide” a lot of the formal machinery from the person in charge
of entering the knowledge. One option is to allow for natural language input.
The next section will elaborate on the potential and limits of this approach.

8 **.2.2** **It’s** **in** **Your** **Books:** **Unstructured** **sources**

Clearly, asking somebody who knows the ﬁeld is the best choice when look-
ing for a certain piece of knowledge. However, another option that comes
to mind immediately when asked for a source of knowledge is just books or
– more generally – all kinds of textual resources including also magazines,

2 It is well known that humans, just like other animals, can learn from a set of examples,
without ever being given or producing explicit rules. The famous 1964 quotation “I know it
when I see it” from Potter Stewart, Associate Justice of the United States Supreme Court,
is an anecdotal example of this phenomenon. He was asked to give an explicit deﬁnition of
hardcore pornography.

<||WXb23TXrUn3Rxz00yNNr89HV||>Web pages, and the like. While (spoken) language was a “solution” to con-
veying knowledge directly from one person to another, writing was a solution
to externally storing information for the purpose of later retrieval. So when
looking for large amounts of directly accessible knowledge, it seems to be a
straightforward idea to collect written texts – at least those that are available
digitally.
Still, texts in natural language are easily accessible to human information
processing only. Extracting formal speciﬁcations from arbitrary written texts
is still considered a hard problem, although intense research has been car-
ried out in the ﬁelds of artiﬁcial intelligence and in particular computational
linguistics.
Approaches to knowledge acquisition from textual resources can be catego-
rized based on the degree to which they attempt to analyze the grammatical
structure of the sentences under consideration – in linguistics, this analysis is
usually referred to as *parsing* .
Methods that do not apply any parsing can still be useful in certain scenar-
ios, depending on the level of detail (also called *granularity* ) that is required
from the resulting knowledge base. If the information to be extracted is just
what a certain text roughly is about, a statistical analysis of the words occur-
ring in a document will most likely give suﬃcient hints. Techniques, in which
the pure occurrence and frequency of certain words are measured without
taking the word order into account are called *bag-of-word* approaches.
It is quite obvious that bag-of-word techniques cannot extract all the knowl-
edge in a text: the two sentences “Pascal supervises Markus” and “Markus su-
pervises Pascal” cannot be distinguished by an algorithm just counting words
while they certainly carry diﬀerent meanings. ^3^

In the following, we make an attempt to sketch the necessary bits and pieces
to come up with a system that employs extensive parsing to extract as much
knowledge from a written text as possible. En route we will see the diﬃculties
that arise when trying to construct such a system. We choose the following
sentence to illustrate our explanations:

Markus does not like animal food. But he ordered a Thai dish that contains ﬁsh.

**Parsing** **and** **Pronoun** **resolution** In this step, each sentence of the text
under consideration is grammatically analyzed. Usually, this step is composed
of several subtasks such as part-of-speech tagging, named entity recognition,
chunking, word-sense disambiguation. We will not go into further details here.
The result of this procedure is a structural representation of the grammatical

3 A somewhat more subtle example would be: “Clearly, not all of Sebastian’s jokes are witty”
vs. “Clearly, all of Sebastian’s jokes are not witty.”

<||WXb23TXrUn3Rxz00yNNr89HV||>like

*subj*

} { ^{{{{{{{^
*aux*

*obj*

^B^
B
B
B
B
B
B
B
ordered

*adj*

~ | ^|||||||^
*subj*

*obj*

! ^C^
C
C
C
C
C
C
C

Markus does

*neg*

food

*mod*

But he dish

*det*

} { ^{{{{{{{^

*mod*

*rel* *−* *cl*

" ^D^
D
D
D
D
D
D
D

not animal a Thai contains

*subj*

| z ^zzzzzzz^
*obj*

! ^B^
B
B
B
B
B
B
B

that ﬁsh

**FIGURE** 8 **.1** : Parse trees for the two example sentences

interdependencies. A dependency structure generated for our example might
look like the one depicted in Fig. 8 .1.
Designing reliable and robust parsing algorithms is not trivial and heavily
depends on the considered language; moreover, there are sentences that have
several admissible parse trees. Usually humans resolve such parsing problems
by context information or background knowledge. Still, at least for English,
oﬀ-the-shelf parsers are available which work well in most cases.
Next, note that the considered text contains words that actually substitute
other words, so-called pronouns. For each of those pronouns ( he, that ) the
referent has to be determined. In our case he refers to Markus and that to
dish .
Clearly both parsing and pronoun resolution cannot always be correct: of-
ten, sentences are ambiguous and therefore, no unique correct syntactic anal-
ysis is possible. ^4^ This constitutes just one of the many severe obstacles to the
acquisition of knowledge from text.

**Formalization** The next step that we have to tackle is to transform the
linguistic structure into a logical description. This step is certainly the most
intricate one. Clearly a thorough description of all technical details would
be beyond the scope of this book so we will just very informally sketch the
general strategy and possible problems.
Well, taking a step back, why should the grammatical structure of a sentence
in natural language be of any use when trying to grasp its semantics? The
basic idea behind this is the assumption of the *compositionality* of natural
language semantics: the meaning of a (part of a) sentence can be derived
from the meaning of its components. So, in the end, the meaning of the

4 Remember just the frequently cited example: “The man saw the girl with a telescope.”

<||WXb23TXrUn3Rxz00yNNr89HV||>sentence relies on the meaning of the words contained in it. However, the
grammatical structure of a sentence is assumed to provide the information on
how to combine the partial meanings to a composite meaning. Mark that this
principle is strictly applied in artiﬁcial formalisms: clearly the meaning (i.e.
the interpretation) of a description logic class expression can be derived from
the meaning of its atomic constituents, the class names, by combining them
as indicated by the constructors.
Thus, it is plausible to interpret grammatical interdependencies of sen-
tence parts as logical interdependencies. Therefore the parse trees of a text
are usually converted into logical statements by recursively applying a set of
transformation rules. What those look like exactly depends on the target for-
malism and on some more encoding decisions. In the case of OWL, named
entities (like Markus ) are usually translated into individuals, adjectives (like
Thai ) and intransitive verbs (like sleep ) into classes, and transitive verbs (like
like ) into roles. ^5^ Nouns (like dish ) are normally translated into classes unless
they express some relation (like brother ).
The description logic counterpart of the noun phrase “dish that contains
ﬁsh” would be constructed from the class names `Dish` and `Fish` and the role
name `contains` , yielding the class expression `Dish` *⊓∃* `contains` *.* `Fish` .
Finally, the above text might be translated into the following DL axioms:

*¬∃* `likes` *.* ( `Animal` *⊓* `Food` )   `markus` 

*∃* `ordered` ( `Dish` *⊓∃* `contains` *.* `Fish` )   `markus` 

Some problems or peculiarities become apparent from this small example.
Some words from the original sentence have disappeared. While this is okay
for pronouns that have been linked to their referents and for articles like
a or the that do not carry a separate meaning, the disappearance of the
word but indicates that our transformation has not been entirely lossless.
Although certainly carrying a meaning, this word is hard to convert into a
logic formalism like RDF(S) or OWL, unlike other words or phrases like and ,
or , or not that have a straightforward logical counterpart. ^6^ Generally, we can
note that it is next to impossible to formalize natural language in a way that
preserves all its subtleties.
The attentive reader might have already spotted another sloppiness that
we were committing. By our translation, diﬀerent tense forms of the same
verb would be assigned to completely unrelated classes (like sleeps and slept )
or roles (like orders and ordered ). One remedy to this problem would be to

5 In linguistics, a verb is referred to as *transitive* if it requires an object, whereas *intransitive*
verbs don’t.
6 Essentially, “but” is used to object to an intuitive consequence of previously expressed
information.

<||WXb23TXrUn3Rxz00yNNr89HV||>use only normalized words, e.g., nouns in nominative singular form and verbs
in inﬁnitive form. But then, the temporal information carried by the original
sentence is lost. In fact it is non-trivial to accommodate temporal informa-
tion in the standard ontology languages and there is no well-established best
practice how to do this.

**Integration** **with** **Lexical** **Background** **Knowledge** Another step that
has to be taken when converting language into a formal representation is to
account for semantic relationships between the involved words. The usage of
language in human communication relies on the presence of a shared body
of knowledge, usually referred to as *common* *sense* or *background* *knowledge* .
This knowledge contains facts such as “ﬁshes are animals” and “a dish consists
of food” that can be expected to be clear to all humans (whence those facts
are excluded from the communication for eﬃciency reasons). However, such
interdependencies between the lexical atoms – the words – are not accessible
to an automated system. Hence, in order to extract the meaning of a given
text to a larger extent, the relevant lexical background knowledge has to
be explicitly provided. There are well-known free resources of this kind of
knowledge, also called *thesauri* . WordNet ^7^ is certainly the most popular one
for the English language.

As we have seen, the imprecisions and ambiguities that natural languages
exhibit make the creation of reliable tools that convert arbitrary written texts
into ontological descriptions a very challenging task which will arguably never
be fully accomplished. Nevertheless, a natural language “format” for entering
new knowledge into a system would be a very user friendly and thus desirable
feature, in line with the discussion at the end of Section 8.2.1. A way to over-
come at least some of the above problems while keeping the beneﬁts of having
a rather intuitive “knowledge interface” is to use natural language but restrict
it by allowing only certain (unambiguous) grammatical constructions. This
way, one can make sure that the text entered into the system is interpreted
correctly. A natural language constrained in this way is usually referred to as
a *controlled* *language* .

8 **.2.3** **It’s** **on** **the** **Web:** **Semistructured** **Sources**

Sometimes, the source to be “ontologized” comes with some structure that
already reﬂects part of the semantic interdependencies. Link structures of any
kind are one example: hyperlinks between Web pages or, say, wiki articles ref-
erencing each other provide crisp relatedness structures between information
elements. Though being rather unspeciﬁc on the concrete type of related-

7 `http://wordnet.princeton.edu/` ; see also [Fel98]

<||WXb23TXrUn3Rxz00yNNr89HV||>Another ubiquitous example of a semistructured source of information is
ﬁle systems. While a large fraction of the knowledge stored on a computer
is not directly automatically accessible (e.g., what objects a certain digital
photo shows), certain facts can be eﬀortlessly retrieved such as a ﬁle’s type
and size, the date when a photo was taken, or the name of the creator of a
piece of music. Likewise, the folder structure and the respective location of
the stored ﬁles are explicitly available. Naturally, all this data can be cast
into RDF or OWL and consequently used for querying and reasoning.
On top of the more or less directly accessible information in semistructured
sources, additional information might be drawn from their unstructured parts
(like the written information on the Web pages or in wiki articles) by using
techniques described in the previous chapter.

8 **.2.4** **It’s** **in** **the** **Databases:** **Structured** **Sources**

Some sources of knowledge contain only directly accessible information. At
this end of the unstructured vs. structured spectrum we have databases but
also existing ontologies that we might want to reuse in another setting.
Clearly, the content of relational databases can be translated into RDF or
OWL (possibly, *n* -ary relationships have to be reiﬁed as described in Sec-
tion 2 .3.3). The necessary additional information that is required for such a
translation is how exactly to transform a row of a table into a set of RDF or
OWL statements. Such “import” of databases into an ontology is mostly used
for *ontology* *population* , meaning that assertional knowledge (i.e. knowledge
about single individuals) is added to an ontology.
On top of their actual content, databases might also contain schema infor-
mation that, e.g., speciﬁes cardinality constraints on certain relations (such
as “every person has at least one nationality”). Partially, this schema infor-
mation can also be translated into terminological axioms. There are even
applications using description logic reasoners for checking the consistency of
database schemata.

Besides databases, another structured source of knowledge is other ontolo-
gies. Before starting to construct a new ontology from scratch, it might make
sense to look for other ontologies that can be (maybe partially) reused. Pos-
sibly, there is already an ontology available which thoroughly covers some

8 Note, however, that there are wiki-based content management systems that allow users to
specify the type of a link explicitly. We elaborate on them in Section 9 .2.
9 Google’s PageRank algorithm is one prominent example of this.

<||WXb23TXrUn3Rxz00yNNr89HV||>aspects of the domain or maybe an upper-level ontology (an ontology cover-
ing the most general concepts of a domain or even of everything) can be used
and extended by more speciﬁc information.
While extending one given ontology by more information (or pruning it) is
arguably more or less straightforward, problems usually arise as soon as two or
more formerly independent ontologies are involved and have to be reconciled.
They might rely on diﬀerent ways of modeling, on diﬀerent naming schemes,
or even on diﬀerent modeling languages.
No matter whether several source ontologies are to be integrated into one
( *ontology* *merging* ) or to be more loosely coupled ( *ontology* *alignment* ), the
usual way of overcoming the mentioned diﬀerences is to come up with *ontology*
*mappings* that clarify how the (individual, class, or role) names of one ontology
correspond to those of the other. Those mapping correspondences might be
equivalences (e.g., `ukonto:Lorry` and `usonto:Truck` ), subclass relationships
(e.g., `bioonto:Loxodonta_africana` and `circusonto:Elephant` ), or others.
Mappings can be either manually speciﬁed, automatically determined, e.g.,
from the names and labels used in the ontologies, or extracted from other
sources like texts – with a corresponding error rate. Of course, combinations
of those approaches are also possible.
Clearly, the task of using existing ontologies as knowledge source does also
touch on aspects of modularity that we will brieﬂy discuss in Section 8 .4.

8 **.3** **Quality** **Assurance** **of** **Ontologies**

After having discussed various ways of creating ontologies, we now address
the question how the quality of a created ontology can be assessed. Moreover,
we will see how an existing ontology can be improved in order to rank better
in terms of the presented evaluation criteria.

8 **.3.1** **Ontology** **Evaluation:** **What** **Makes** **an** **Ontology** **Good**

So, how to tell if an ontology is good or not? The most straightforward
criterion is just: does it fulﬁll the intended purpose? Is it possible to infer
the knowledge that one wants to capture with the ontology? Do its logical
consequences interpreted by the user coincide with the reality as conceived by
the user? And ﬁnally: does the information provided by the ontology together
with a reasoning framework help the user in accomplishing his task?
It becomes clear that many of those questions can be answered only in
the context of the concrete application scenario that an ontology is being
developed for. Notwithstanding, we can identify several basic criteria that an
ontology has to satisfy irrespective of the speciﬁc intended usage.

<||WXb23TXrUn3Rxz00yNNr89HV||>**Logical** **Criteria** The ﬁrst group of criteria comprises ontology character-
istics that can be checked on a purely logical level, based on the notion of
logical consequence as discussed in Section 5 .2.1.3.
We remember that an ontology is called *inconsistent* or *unsatisﬁable* , if it
has no model, i.e. if there is no possible world in which all the statements
of the ontology hold. Yet, as the purpose of an ontology is to characterize a
world (namely, the domain it is supposed to describe), ontology inconsistency
does in almost every case indicate a modeling error. Moreover, an inconsis-
tent ontology entails any statement as a logical consequence, whence it cannot
be reasonably used for tasks involving automated deduction. Therefore, log-
ical consistency is one of the essential necessary criteria for an ontology to
be useful. In the previous chapters, algorithms for automatically checking
an ontology’s consistency were introduced. By means of these, continuous
consistency checks during the design phase of an ontology can be performed
and the ontology engineer can be alerted as soon as his way of modeling the
domain leads to an inconsistency.
In addition to this “severe” form of global inconsistency, there exists the
weaker version of *inconsistent* (or *unsatisﬁable* ) *classes* . A class is called
unsatisﬁable if it is interpreted as the empty set in any model. Let’s have a
look at the following example:

`Horse` *⊑¬* `Flies`
`FlyingHorse` *≡* `Horse` *⊓* `Flies`

The ﬁrst statement claims that every horse does not ﬂy while the second
deﬁnes a new class exactly as those horses that ﬂy. This forces the class of
ﬂying horses to be empty in every model. Note that this ontology is still
globally consistent. However, it turns inconsistent if we add an instance of
the inconsistent class, like `FlyingHorse` ( `pegasus` ) . Normally, an ontology
engineer deﬁnes a new class only if it (at least possibly) has instances – deﬁning
a class of male sisters would be just pointless. Thus, a class that is necessarily
empty due to logical constraints often indicates some modeling ﬂaw. An
ontology that does not contain unsatisﬁable classes is called *coherent* . As
indicated by the example above, a consistent ontology can be incoherent, but
a coherent ontology cannot be inconsistent. Today’s standard ontology editors
(see Section 8.5.1) provide tools for diagnosing incoherency and inconsistency.
Inconsistency and incoherency often arise when too restrictive statements
are made about the domain of interest, thereby constraining the possible
models too much. By weakening or abolishing the statements, an ontology can
be made consistent or coherent again, thereby fulﬁlling the criteria mentioned
above.
However, weakening an ontology does certainly not always improve its qual-
ity. On the contrary: clearly, we want an ontology to contain as much infor-

<||WXb23TXrUn3Rxz00yNNr89HV||>mation about the domain as possible. *Logical* *completeness* is a criterion that
captures this desire by formal means.
To illustrate this notion, consider the following ontology snippet. Its termi-
nological part tells us that no bird is a mammal, that birds lay eggs, and that
every egg-laying species does not give live birth. The assertional part states
that ostriches are a bird species while lions are a mammal species that give
live birth.

`Bird` *⊑¬* `Mammal` `Bird` ( `ostrich` )
`Bird` *⊑* `Oviparous` `Mammal` *⊓* `Viviparous` ( `lion` )
`Oviparous` *⊑¬* `Viviparous`

From this speciﬁcation, we are able to derive that ostriches are oviparous
animals and that lions are not birds. However, the knowledge base does not
inform us whether the axiom

`Mammal` *⊑* `Viviparous`

is true in the described domain, as we can neither infer it from the above
axioms nor can we be sure that it does not hold, since due to the open world
assumption, there might be additional information not recorded in the knowl-
edge base. This means that our ontology is incomplete with respect to subclass
statements on atomic classes. In this case, we could resolve this incomplete-
ness by adding the fact

`Mammal` *⊓* `Oviparous` ( `platypus` )

giving account of an oviparous mammal species and thereby refuting the above
axiom.
Note that, besides subclass statements, the logical completeness with re-
spect to other types of axioms – such as class disjointness, property restric-
tions, or even more complex statements – might be worthwhile aspiring to.

**Structural** **and** **Formal** **Criteria** In addition to the aforementioned logi-
cal criteria, there are further situations that can be more or less automatically
diagnosed and that are indicative of possible modeling problems. For some
of them, no sophisticated reasoning is necessary. For example, explicit tax-
onomic cycles can be read directly from an ontology. Consider the following
speciﬁcation.

<||WXb23TXrUn3Rxz00yNNr89HV||>`Architecture` *⊑* `Faculty` `Faculty` *⊑* `University`
`University` *⊑* `Building` `Building` *⊑* `Architecture`

Through the circular chain of subclass statements, this taxonomy collapses
semantically, i.e. logically, all the involved classes `Architecture` , `Faculty` ,
`University` , and `Building` are equivalent. However, it is rather unlikely that
an ontology deliberately contains many semantically equivalent classes, so this
might be hinting at a ﬂaw in the ontology.
Further evaluation criteria based on the subclass hierarchy of an ontology
examine the nature of the used classes. As an example of the general qualities
a class may have, we consider *rigidity* . A class is considered rigid if every
member of it cannot cease to be a member without losing existence. As an
example, a person cannot just stop being a person, whereas a student can stop
being a student while retaining his existence and most of his other attributes.
In the latter case, one can even state that every (not just some) instance of
the class of students has the potential of not being a student. In that case, a
class will be called anti-rigid.
This way, every class can be marked as being rigid, anti-rigid, or none of
both, where the decision might not always be that clear and people might
disagree on certain cases; the choice might even depend on the speciﬁc mod-
eling task. However, it isn’t too hard to see that, for instance, a rigid class
cannot be a subclass of an anti-rigid one. Rather, every subclass of an anti-
rigid class must itself be anti-rigid. Hence, this criterion can be used to check
whether a class hierarchy is correctly modeled. *Identity* , *unity* , and *depen-*
*dence* are examples of more qualities a class might have and which give rise to
further constraints and evaluation criteria for class hierarchies. An elaborate
methodology based on those called OntoClean. ^10^

**Accuracy Criteria** Obviously, a central requirement (and hence evaluation
criterion) is whether the ontology accurately captures those aspects of the
modeled domain that it has been designed for. In particular, the logical
statements that it contains or allows us to infer should faithfully correspond
to the state of aﬀairs in the real world.
The aforementioned evaluation criteria can provide useful hints with respect
to this question in that they are necessary preconditions for accuracy. Yet,
even if everything seems to be all right from that perspective, conceptual
modeling errors (as opposed to logical ones) might have been overlooked.
Clearly, real-world-conformance of an ontology cannot be checked entirely
automatically as this would require that the outer world state of aﬀairs has

10 `http://www.ontoclean.org/`

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.3.2** **How** **to** **(Not)** **Model** **Correctly**

This section aims at being a checklist for people modeling an ontology
in RDF(S) or OWL. It does not claim to be exhaustive nor objective. It
just enumerates some suggestions that the authors consider relevant when
modeling an ontology. As there is no unique way of modeling a situation
and it is often a matter of taste which option is the best one, most of our
suggestions will refer to “ *don’t* s” instead of “ *do* s,” indicating misconceptions
and imprecisions that should be avoided.

8 **.3.2.1** **Don’t** **forget** **disjointness**

Consider the following simple knowledge base:

`Man` *⊑* `Human` `Human` *⊑* `Man` *⊔* `Woman` `Woman` *⊑* `Human`
`Man` ( `pascal` ) `Woman` ( `anne` )

At ﬁrst glance, it might seem that all the dependencies between the classes
`Human` , `Woman` , and `Man` are completely speciﬁed. But when asking a reasoner
whether *¬* *Woman* ( *pascal* ) is entailed by the above axioms, it turns out that
this is not the case. The point is that no logical reasons prevent `pascal` from
being both `Man` and `Woman` . To logically ﬁx this shortcoming one has to state
that `Man` and `Woman` are disjoint, i.e. there is no individual contained in both
classes.
In practice, disjointness statements are often forgotten or neglected. The
arguable reason for this could be that intuitively classes are considered disjoint
unless there is other evidence. By omitting disjointness statements, many
potentially useful consequences can get lost. The following is a good strategy
to counter the problem in case of a class hierarchy that is already formalized:

11 Philosophically, this issue is closely related to the widely discussed so-called *symbol*
*grounding* *problem* .

<||WXb23TXrUn3Rxz00yNNr89HV||>*Explicitly* *consider* *all* *siblings,* *i.e.* *classes* *having* *a* *common* *su-*
*perclass,* *whether* *it* *is* *possible* *that* *an* *individual* *is* *an* *instance* *of*
*both* *classes.* *If* *not,* *declare* *them* *as* *disjoint.*

8 **.3.2.2** **Don’t** **forget** **role** **characteristics**

Just like class disjointness, characteristics that can be assigned to roles (or
properties, respectively) can enable a lot of useful deductions.

*Consider* *for* *every* *role* *occurring* *in* *an* *ontology* *whether* *it* *rep-*
*resents* *a* *transitive,* *symmetric,* *functional,* *and/or* *inverse* *func-*
*tional* *relation.*

Note that in OWL 2, even more information about roles can (and should)
be expressed: reﬂexivity and irreﬂexivity, antisymmetry and role disjointness,
as well as interdependencies involving role chains. As a caveat, note that
declaring a role transitive might turn an OWL DL ontology into an OWL Full
ontology, for which less tool support is available. In that case, expressivity
has to be weighed against what is computationally manageable.

8 **.3.2.3** **Don’t** **choose** **too** **speciﬁc** **domains** **or** **ranges**

The problem of too narrow domain or range restrictions has been already
addressed twice in previous chapters: in Section 2 .4.5 as well as in Sec-
tion 4 .1.9. We will not elaborate on them in detail.

*It* *is* *worthwhile* *to* *check* *all* *occurrences* *of* *a* *property* *(or* *role,* *re-*
*spectively) in an ontology and make sure that the declared domains*
*and* *ranges* *apply* *to* *every* *single* *one* *of* *those* *usages.*

8 **.3.2.4** **Be** **careful** **with** **quantiﬁers**

The usage of quantiﬁers on roles or – speaking in terms of OWL – the
`owl:someValuesFrom` and `owl:allValuesFrom` restrictions may cause some
conceptual confusion to “modeling beginners.” As a rule of thumb, when
translating a natural language statement into a logical axiom, existential
quantiﬁcation occurs far more frequently; e.g., a proposition like “birds have
wings” should be translated as `Bird` *⊑∃* `has` *.* `Wing` . The erroneous translation
`Bird` *⊑∀* `has` *.* `Wing` would convey the information that birds have *only* wings
(if they have anything at all) and nothing else. Natural language indicators
for the usage of universal quantiﬁcation are words like “only,” “exclusively,” or
“nothing but.”
There is one particular misconception concerning the universal role restric-
tion. As an example, consider the statement

`Happy` *≡∀* `hasChild` *.* `Happy`

<||WXb23TXrUn3Rxz00yNNr89HV||>that could be translated to “somebody is happy exactly if all his/her children
are happy.” However, the intuitive reading suggests that in order to be happy,
a person must have at least one happy child. Yet, this is not the case: any
individual that is not the starting point of any role *R* is a class member of
any class *∀* *R.C* irrespective of the class *C* . ^12^ Hence, by our above statement,
every childless person would be qualiﬁed as happy. In order to formalize the
aforementioned intended reading, the statement would have to read as follows:

`Happy` *≡∀* `hasChild` *.* `Happy` *⊓∃* `hasChild` *.* `Happy`

*Make* *sure* *that* *the* *intended* *meaning* *is* *correctly* *cast* *into* *role*
*quantiﬁcations.* *Use existential quantiﬁcation as default.* *Be aware*
*that* *universal* *quantiﬁcation* *alone* *does* *not* *enforce* *the* *existence*
*of* *a* *respective* *role.*

8 **.3.2.5** **Don’t** **mistake** **parts** **for** **subclasses**

Have a look at the following small TBox of a knowledge base:

`Finger` *⊑* `Hand` `Hand` *⊑* `Arm` `Arm` *⊑* `Body`
`Toe` *⊑* `Foot` `Foot` *⊑* `Leg` `Leg` *⊑* `Body`
`Arm` *⊓* `Leg` *⊑⊥*

Seems all right, doesn’t it? We can even employ a reasoner to deduce
`Hand` *⊑* `Body` or that `Finger` and `Toe` are disjoint.
However, some problems occur as soon as we have a closer look at indi-
viduals. Suppose that the ABox of the knowledge base ABox contains the
fact `Finger` ( `sebastiansRightThumb` ) . But this obviously allows us to deduce
`Arm` ( `sebastiansRightThumb` ) , hence Sebastian’s right thumb is not only a
ﬁnger but an arm as well. What’s wrong here? Well, we have mistaken the
part-of relation for the subclass relation or in linguistic terms *meronymy* for
*hyponymy* .
Admittedly, it is tempting to do so, as those two relations share both the
intuition of “belonging to something” as well as some formal properties such as
being transitive. ^13^ However, as we have just seen, this can lead to considerable

12 In particular, note that the class description *∀* *R.* *⊥* characterizes exactly those individuals
without an outgoing *R* role.
13 The general question whether a part-whole relationship should be transitive is a more
diﬃcult discussion we do not want to take up here. If it is understood in a physical sense,
then it should be transitive, but there are other usages where transitivity would not be
appropriate. See, e.g., [WCH87] for a detailed discussion.

<||WXb23TXrUn3Rxz00yNNr89HV||>confusion and unintuitive logical consequences. Therefore, a better practice
to model meronymy is by using a dedicated role, say `partOf` , which may be
declared transitive. The corrected above example would then read like this:

`Finger` *⊑∃* `partOf` *.* `Hand` `Hand` *⊑∃* `partOf` *.* `Arm` `Arm` *⊑∃* `partOf` *.* `Body`
`Toe` *⊑∃* `partOf` *.* `Foot` `Foot` *⊑∃* `partOf` *.* `Leg` `Leg` *⊑∃* `partOf` *.* `Body`
`Arm` *⊓* `Leg` *⊑⊥*

Actually there is a rather reliable way to diagnose whether one class should
be declared as a subclass of another one.

*A class A should be modeled as a subclass of B only if the statement*
*“every* *A* *is* *a* *B”* *makes* *sense* *and* *is* *correct.*

8 **.3.2.6** **Watch** **the** **direction** **of** **roles**

The following RDFS snippet illustrates another typical modeling error:

`ex:author` `rdfs:range` `ex:Publication` `.`
`ex:author` `rdfs:domain` `ex:Person` `.`
`ex:macbeth` `ex:author` `ex:shakespeare` `.`

A closer look reveals that something is wrong with the “direction” of the
authorship property. In fact, RDFS consequences of the above triples would
be that Macbeth is a person (which might be somewhat acceptable) and that
Shakespeare is a publication (which is certainly wrong). In fact those modeling
errors are surprisingly frequent and not always as obvious as in our case, in
particular in cases where one ontology is edited by several people. Essentially,
there are two ways to avoid these problems.

*When* *introducing* *a* *new* *property* *or* *role* *name,* *add* *a* *comment*
*that* *clariﬁes* *what* *its* *source* *and* *target* *are.* *Moreover,* *use* *names*
*which* *allow* *only* *one* *unique* *intuitive* *reading.*

In the case of nouns (like “author”), such unambiguous names might be con-
structions with “of” or with “has” ( `authorOf` or `hasAuthor` ). For verbs (like
“to write”) an inﬂected form ( `wrote` or `writes` ) or a passive version with “by”
( `writtenBy` ) would prevent unintended readings.

8 **.3.2.7** **Don’t** **confuse** **class** **subsumption** **and** **class** **equivalence**

When modeling correspondences between classes, some uncertainty might
arise whether to use subsumption or equivalence (i.e. `rdfs:subClassOf` or
`owl:equivalentClass` ).

<||WXb23TXrUn3Rxz00yNNr89HV||>Usually, class subsumption is used to provide some information about mem-
bers of a certain class, e.g., to express that all ﬁsh live in water. In this sense,
living in water is a *necessary* condition for being a ﬁsh (as not living in the
water excludes a being from that class). However (as witnessed by plankton,
dolphins, etc.), not every being that lives in water is a ﬁsh or, in other words,
living in water is no *suﬃcient* criterion for the class-membership as it does
not fully characterize ﬁshes.

*Only* *if* *a* *class* *description* *is* *both* *necessary* *and* *suﬃcient,* *an*
*equivalence* *statement* *should* *be* *used.*

This is normally the case if a new class is introduced and deﬁned in terms of
known classes, as for instance an orphan is deﬁned as a person all of whose
parents are dead:

`Orphan` *≡* `Person` *⊓∀* `hasParent` *.* `Dead`

8 **.3.2.8** **Don’t** **translate** **too** **verbally**

Although there are many useful heuristics for translating natural language
into ontological speciﬁcations, one has to be careful when using them. As
a basic example, the word “and” is not always meant to be an intersection
of classes. Clearly, the “and” in the sentence “university staﬀmembers and
students will get a login” will be translated into a union ( `UniStaffMember` *⊔*
`Student` *⊑∃* `gets` *.* `Login` ) and not into an intersection ( `UniStaffMember` *⊓*
`Student` *⊑∃* `gets` *.* `Login` ). The latter would express the weaker statement
that an individual gets a login if it is both a university staﬀmember and a
student.

*If* *in* *doubt* *about* *the* *correct* *formalization,* *two* *strategies* *that*
*might* *help* *are* *paraphrasing* *and* *testing.*

On the one hand, one might paraphrase the proposition in order to get a
clearer view. In our case, the reformulated sentence might be “somebody will
get a login, if he is a university staﬀmember or a student.” On the other hand,
having reasoning tools at hand, one might do some kind of testing. Knowing
that the above statement, e.g., allows us to deduce *∃* `gets` *.* `Login` ( `paul` ) if we
assert `Student` ( `paul` ) , we might simply try either of the above options and
employ a reasoner to check whether the desired consequence is entailed.

8 **.3.3** **Ontology Reﬁnement:** **How to Make Ontologies Better**

After having identiﬁed basic characteristics for the quality of ontologies,
we now investigate ways of improving an existing ontology in the light of

<||WXb23TXrUn3Rxz00yNNr89HV||>some criteria introduced in the previous section. Thereby, we will put special
emphasis on automated techniques.
We start by considering the situation where an ontology is inconsistent or
incoherent. As explained earlier, this indicates that something is wrong with
the ontology, in other words: some part of the speciﬁcation does not corre-
spond with the actual state of aﬀairs. There are several ways to deal with
this. One way is to “manually” examine the ontology and look for incorrect
statements. The ontology might be too large to check every single statement
or the modeling error could result from an intricate interplay of several ax-
ioms and therefore be hard to detect. However, reasoning methods can be
used to identify the set of axioms responsible for the inconsistency or inco-
herency. In general, so-called *explanation* tools are capable of coming up with
justiﬁcations for derived consequences of a knowledge base. This enables the
knowledge engineer to focus on the relevant parts of the ontology when look-
ing for errors. Another way of handling a ﬂawed inconsistent or incoherent
ontology is to employ automated methods that try to reestablish consistency
resp. coherency by committing as few changes as possible to the ontology.
Most of the employed techniques originate from the area of *belief* *revision*
having a long tradition in AI research.
In the case of an ontology not containing enough information to allow for the
retrieval of the wanted information, one can again distinguish between human-
driven and machine-driven approaches. A human user might experience that a
consequence he would expect cannot be inferred from the current speciﬁcation
and try to “debug” the knowledge base with respect to this shortcoming.
Thereby certain non-standard reasoning methods called *abductive* *reasoning*
might be helpful. ^14^

On the more automated side, there are algorithms that step by step enu-
merate those statements (of a certain form) which can neither be deduced
from the given ontology nor refuted on its grounds. The knowledge engineer
can then decide for each of those statements whether to add it or its negated
counterpart to the ontology. This way the ontology can be successively com-
pleted.

8 **.4** **Modular** **Ontologies:** **Divide** **and** **Conquer**

Another engineering aspect that is gaining more and more attention is the
modularization of ontologies. Essentially, the ﬁeld of ontology modularization

14 Together with deduction and induction, abduction constitutes the three modes of human
reasoning due to C.S. Peirce [Ket92]. Essentially, abduction answers the question what
premise would entail a desired conclusion, given a body of knowledge.

<||WXb23TXrUn3Rxz00yNNr89HV||>investigates how large ontologies can be composed of smaller parts, called
*modules* .
This is a desirable strategy for several reasons. Just as in software engineer-
ing, the increasing size and complexity of the artifacts necessitates strategies
for collaborative and sustainable ontology design. Now, if ontologies are de-
signed as loosely coupled, essentially self-contained systems, this facilitates
diverse typical engineering activities. First, many maintenance tasks can be
done locally by changing just the speciﬁc module in question. Next, the
single components resp. modules can be reused in other contexts more eas-
ily. Further, from a more technical perspective, under certain circumstances
reasoning tasks can be done more eﬃciently, as only a small part of the mod-
ules might be relevant for speciﬁc deductions or the reasoning itself can be
distributed to several machines separately handling the modules. The latter
point is also relevant if privacy and security issues come into play: an ontology
owner might not be willing to disclose the entire ontology but only to oﬀer
some reasoning services. Then for the integrated querying of this and other
ontologies, distributed reasoning approaches are necessary.
As there are already large ontologies that do not or not suﬃciently abide by
this modularity rationale, there is also ongoing research on automatically or
semi-automatically subdividing monolithic ontologies into modules in order
to exploit the above mentioned advantages modular ontologies bring about.
OWL and OWL 2 provide basic support for the distribution resp. module
aspects through `owl:imports` allowing for the inclusion of other ontologies
that might be situated elsewhere on the Web (see Section 4 .1.1).

8 **.5** **Software** **Tools**

There is a considerable number of tools available for diﬀerent aspects of
ontology engineering. Many of them are research prototypes, however, and
do not keep up to the standards of commercial solutions. Rather than giving
a complete listing, we provide in this section pointers to the most popular
and mature tools with recent releases, ^15^ including commercial systems, and
mention only a few additional ones because we deem them important for some
reason. Our selection is necessarily subjective.
Comprehensive lists of Semantic Web tools – including research prototypes
– can be found under `http://semanticweb.org/wiki/Tools/` and under
`http://esw.w3.org/topic/SemanticWebTools/` .

15 We are always referring to the most recent version at the time of this writing, i.e. March
2 009.

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.5.1** **Ontology** **Editors**

8 **.5.1.1** **Prot** **é** **g** **é**

Protégé is currently the most well-known ontology editor, is freely available,
open source, and based on Java. Protégé is extensible and supported by a
large community of users and of developers providing a considerable number
of plug-in extensions. It also provides a plug-and-play environment to aid
rapid prototyping and application development.
Protégé was developed by the Stanford Center for Biomedical Informatics
Research in collaboration with The University of Manchester. It is available
from `http://protege.stanford.edu/` . Besides RDF support, it comprises
an OWL editor, called Protégé-OWL, which is actually an extension of the
core system.
Protégé comes with two built-in reasoners, FaCT++ and Pellet (see below),
and provides reasoning support during the editing process, e.g., by allowing
one to compute all subclass relationships, called classiﬁcation of the ontology.
It also provides SWRL support and is tightly integrated with Jena (see below).

8 **.5.1.2** **TopBraid** **Composer**

The commercial TopBraid Composer, by the company TopQuadrant, is
available from `http://www.topquadrant.com/topbraid/composer/` . It has
built-in support for Pellet, Jena, and OWLIM (see below) and supports RDFS
and OWL. SWRL is supported via Jena, and SPARQL can be used. The Top-
Braid Composer sports a considerable number of built-in features for ontology
engineering tasks.

8 **.5.1.3** **NeOn** **Toolkit**

The NeOn Toolkit is an extensible ontology engineering environment avail-
able from `http://www.neon-toolkit.org` and developed as open source soft-
ware by a consortium of European research facilities and companies. It is built
on the code-base of OntoStudio (see below). The NeOn Toolkit sports vari-
ous extensions and modules, some of which are commercial. It supports RDF
and OWL DL and has native reasoning support through the KAON2 reasoner
(see below). At the same time, the NeOn Toolkit also supports rule languages
around RIF.

8 **.5.1.4** **OntoStudio**

OntoStudio, by ontoprise GmbH, is a commercial modeling environment for
the creation and maintenance of ontologies. It supports RDF and rules in F-
Logic, and can be used for collaborative ontology development. For further in-
formation see `http://www.ontoprise.de/en/home/products/ontostudio/` .

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.5.1.5** **SWOOP**

SWOOP is an open source tool for creating, editing, and debugging OWL
ontologies available from `http://code.google.com/p/swoop/` under the MIT
free software license. It was originally developed by the mindswap group at the
University of Maryland. It takes the standard Web browser as user interface
paradigm, and provides native support of Pellet (see below).

8 **.5.2** **RDF** **Stores**

8 **.5.2.1** **Virtuoso**

Virtuoso is a cross-platform integrated database engine with (among many
other protocols) RDF and SPARQL support developed by OpenLink Software.
It can be employed as the RDF store/query processor for the frameworks of
Jena and Sesame (see below). It is available as Pay Licensed Closed Source
or as a GPL Open Source version under the name OpenLink Virtuoso. See
`http://virtuoso.openlinksw.com/` for more information and downloads.

8 **.5.2.2** **Redland**

Redland is a collection of free software libraries that enable RDF support.
It was developed by Dave Beckett while he was at the University of Bristol,
UK. It provides APIs for RDF data manipulation and querying via SPARQL,
allows for in-memory and persistent graph storage, and comes with command
line utility programs. It is available under GPL, LGPL, and Apache License.
For downloads and more information see `http://librdf.org/` .

8 **.5.2.3** **Sesame**

Sesame is an RDF framework with inferencing and SPARQL querying sup-
port originally developed by Aduna. It comes with a native store but can also
be used with other storage systems. It includes various developer tools and
is available from `http://www.openrdf.org/` under a BSD-style Open Source
license.

8 **.5.2.4** **AllegroGraph**

AllegroGraph RDFStore, by Franz Inc., is a Pay Licensed Closed Source
RDF database. It supports RDFS reasoning and querying via SPARQL. For
further details, see `http://agraph.franz.com/allegrograph/` .

8 **.5.2.5** **OWLIM**

OWLIM supports RDFS by means of Sesame and a rather small fragment of
OWL DL – as well as a combination of these – but does so rather eﬃciently. It
is freely available from `http://ontotext.com/owlim/` under the GNU LGPL
and commercially supported by ontotext.

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.5.3** **OWL** **DL** **Reasoning** **Engines**

The strongest and most mature reasoners available for OWL DL are based
on tableaux algorithms presented in Section 5 .3, and foremost to mention are
Pellet, FaCT++, and RacerPro as the most well-known systems.

8 **.5.3.1** **Pellet**

Pellet is an open source OWL reasoner written in Java and available from
`http://pellet.owldl.com/` . It supports OWL DL (more precisely *SHOIQ* ),
and is commercially supported by Clark & Parsia LLC. It also supports the
*SROIQ* description logic which underlies OWL 2 DL, and conjunctive query-
ing using SPARQL syntax. It furthermore sports a number of features to
support ontology engineering, including the lightweight ontology browser Owl-
Sight, some analysis and repair functionalities, and support of DL-safe rules.

8 **.5.3.2** **RacerPro**

RacerPro is a commercial OWL reasoner by Racer Systems, and available
from `http://www.racer-systems.com/` . It supports OWL DL, although rea-
soning with nominals is only done in an approximate manner. Various pro-
priety extensions, e.g., for datatype reasoning, are available.

8 **.5.3.3** **FaCT++**

FaCT++ is an open source reasoner under the GNU public license, written
in C++ and developed at The University of Manchester. It is available from
`http://owl.man.ac.uk/factplusplus/` and supports OWL DL as well as
OWL 2 DL.

8 **.5.3.4** **KAON2**

KAON2 is a commercial system, by ontoprise GmbH under the name On-
toBroker OWL, with binaries freely available and free for use for universities
for noncommercial academic usage. In contrast to the aforementioned rea-
soners, KAON2 is not based on tableaux algorithms, but on the resolution
calculus. KAON2 supports *SHIQ* and DL-safe rules. Conjunctive queries
can be expressed using SPARQL syntax. KAON2 binaries are available from
`http://kaon2.semanticweb.org/` .

8 **.5.3.5** **SHER**

SHER is a reasoner for *SHIN* based on Pellet which uses some enhance-
ments of database indexing to obtain higher reasoning speed. It was developed
by IBM and is available from `http://www.alphaworks.ibm.com/tech/sher/` .

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.5.4** **Reasoning** **Engines** **for** **OWL** **2** **Proﬁles**

8 **.5.4.1** **CEL**

CEL was the ﬁrst dedicated reasoner for *EL* ^++^ , though without support for
nominals and ABoxes. *EL* ^++^ will be part of the forthcoming OWL 2 standard
as OWL 2 EL. It is restricted to classifying such ontologies, i.e. to computing
all subclass relationships. It is free for evaluation and research purposes and
can be obtained from `http://lat.inf.tu-dresden.de/systems/cel/` . It
was developed by the Technical University of Dresden.

8 **.5.4.2** **Owlgres**

Owlgres is a reasoner for the DL-Lite fragment of the forthcoming OWL standard, i.e. OWL 2 QL. It is available under the GNU AGPL 3 open source
license from `http://pellet.owldl.com/owlgres` , while commercial support
is provided by Clark & Parsia LLC. Owlgres allows one to formulate conjunc-
tive queries in SPARQL syntax.

8 **.5.5** **QuOnto**

QuOnto, developed by “Sapienza” University of Rome is an OWL 2 QL rea-
soner. It is available from `http://www.dis.uniroma1.it/quonto/` as a demo
version for testing purposes. It supports conjunctive queries and SPARQL.

8 **.5.5.1** **Oracle** **11g**

Oracle 11g supports RDF(S) and the OWL 2 RL proﬁle of OWL 2 for ontol-
ogy management. It comes with an adaptor for Jena. For more information,
see `http://www.oracle.com` .

8 **.5.6** **Datalog** **and** **Rules** **Engines**

We obviously restrict ourselves to rules engines which can handle rules as
introduced in Chapter 6 .

8 **.5.6.1** **XSB**

XSB is a well-known open source Prolog system developed by the Com-
puter Science Department of Stony Brook University and others. It is avail-
able from `http://xsb.sourceforge.net/` . Among the systems building on
it is FLORA-2 – available from `http://flora.sourceforge.net/` – which
is an object-oriented knowledge base language and application development
environment. Its underlying language is F-Logic.

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.5.6.2** **SWI-Prolog**

SWI-Prolog is another very popular open source Prolog system, developed
by Jan Wielemaker at the University of Amsterdam. It is available from
`http://www.swi-prolog.org/` .

8 **.5.6.3** **Ontobroker**

Ontobroker is a commercial logic programming system developed by onto-
prise GmbH, with a long history of ontology-based application development.
It supports reasoning with RIF, with F-Logic, but also with RDF and OWL,
and querying with SPARQL and conjunctive queries. Information is available
from `http://www.ontoprise.de/en/home/products/ontobroker/` .

8 **.5.6.4** **DLV**

DLV is a datalog system which is free for academic and non-commercial
use developed by the University of Calabria. It sports some extensions which
allow one to integrate OWL reasoning in a hybrid way, i.e. rules and OWL
can be used together, but they interact in a less obvious way. It is available
from `http://www.dbai.tuwien.ac.at/proj/dlv/` .

8 **.5.6.5** **IRIS**

IRIS is a system for reasoning with a restricted form of datalog programs
developed by STI Innsbruck under the LGPL license and used for Semantic
Web purposes. It is available from `http://www.iris-reasoner.org/` .

8 **.5.7** **Further** **Systems**

8 **.5.7.1** **OWL** **API**

The OWL API is a Java interface and implementation for OWL 2 . It is
open source and available from `http://owlapi.sourceforge.net/` under the
LGPL license. The OWL API includes an API for OWL 2 and an eﬃcient in-
memory reference implementation, parsers and writers for diﬀerent syntaxes,
support for integration with OWL reasoners, and support for black-box de-
bugging. It is primarily maintained at The University of Manchester.

8 **.5.7.2** **Jena**

Jena is a mature Java framework for building Semantic Web applications de-
veloped by Hewlett-Packard, available from `http://jena.sourceforge.net`
and open source. It provides a programmatic environment for RDF(S) and
OWL, and sports a rule-based OWL inference engine which is incomplete with
respect to the OWL semantics. Jena also supports SPARQL.

<||WXb23TXrUn3Rxz00yNNr89HV||>8 **.6** **Summary**

As ontologies are widely adopted also for large-scale applications, strategies
for their creation, evaluation, and maintenance are needed. The related ﬁeld
of software engineering can provide some useful insights into how to create suc-
cessful ontology engineering processes. For the creation of ontologies, sources
of knowledge can be: human experts, unstructured sources such as texts, semi-
structured sources like wikis or hypertext documents and structured sources
as databases or already existing ontologies. For quality assurance, ontologies
can be evaluated based on several criteria, among them logical, structural,
and formal criteria as well as accuracy. For improving an ontology’s quality,
semiautomatic methods are available. Modularization of ontologies provides
beneﬁts in terms of management and reuse. Several tools for assisting in
diverse ontology management tasks are available.

8 **.7** **Further** **Reading**

As stated earlier, Ontology Engineering is a broad and diverse ﬁeld still
in its infancy. Therefore, the following set of literature recommendations is
necessarily both subjective and tentative.
Edited volumes containing comprehensive overviews on topics related to
ontology engineering are [SS09] and [GPCFL04]. As a shorter ﬁrst read,
[PM04] outlines the parallels of ontology and software engineering.
The question how to make experts’ implicit knowledge explicit is a cen-
tral issue in the scientiﬁc ﬁeld of knowledge management. [NT95] is one of
the standard references addressing this question in the context of compa-
nies. Automated techniques for knowledge acquisition from sets of training
examples provided by experts clearly fall into the realm of machine learning.
[Mit97] gives an excellent introduction on machine learning in general. For the
particular ﬁeld of inductive logic programming, [LD94] provides an in-depth
treatment.
As stated before, techniques for extracting knowledge from natural language
documents can be roughly divided into statistical vs. structural approaches.
Statistically oriented methods are focused on by the discipline of information
retrieval; [MRS07] gives a profound introduction. In particular, latent se-
mantic analysis, a prominent word-bag method, is described in [LD97]. The
term ontology learning refers to the extraction of ontological knowledge from
textual sources; see [MS01]. Diverse approaches to ontology learning are pre-
sented in [BC08], wherein [VHH08] is an example for a structural rather than
statistical approach to that problem. An overview of ontology learning tools

<||WXb23TXrUn3Rxz00yNNr89HV||>can be found in [GPMM04]. On a more abstract level, problems of transfer-
ring natural language texts via structural analysis into logical speciﬁcations
have been intensely dealt with by discourse representation theory [KR93].
References and ongoing work on constrained natural language (“controlled
English”) related to ontologies for the Semantic Web can be found under
`http://wiki.webont.org/page/OwlCnl` .
Network or link analysis [The04] deals with the extraction of information
from graph structures and can be used for coming up with “shallow” semantic
information about interlinked Web pages or wiki articles.
Ontology matching and its subﬁelds ontology alignment, ontology mapping,
and ontology merging have become an increasingly hot topic in ontology man-
agement as evidenced by numerous workshops and publications. [ES07] gives
a good overview of this vibrant ﬁeld.
Techniques for explaining automated inferences to the user are well-estab-
lished and implemented in most related tools. A nicely written explanation
on explanations can be found in [HPS08]. Foundations of the technique of
belief revision and also some hints on its employment for ontology repair are
described in [Gär92].
OntoClean [GW04] is an elaborate, philosophically inspired methodology
for ontology evaluation based on formal criteria that rely on class qualities
such as rigidity.
When modeling his very ﬁrst ontology, the reader may ﬁnd the seminal
guideline [NM] helpful. For avoiding common modeling errors, [RDH ^+^ 04]
gives valuable hints.
Formal Concept Analysis [GW97] can be used as a basis for methods to
complete insuﬃciently axiomatized ontologies as described in [Rud06] and
[Ser07].
The topic of modular ontologies is another example of an emerging ﬁeld
and is currently gaining much interest from the research community. For
a substantial contribution to that ﬁeld, see [CHKS08]; for a thorough and
comprehensive overview of the state of the art, we refer the interested reader
to [SPS09].
Many Semantic Web tools, including research prototypes, are listed with
references and pointers under `http://semanticweb.org/wiki/Tools/` and
`http://esw.w3.org/topic/SemanticWebTools/` .