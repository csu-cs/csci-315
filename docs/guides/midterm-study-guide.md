Midterm Study Guide
===================

See [the syllabus](/syllabus#tentative-weekly-schedule) for the deadline.

The exam will consist of two sections. Take one part during class time.

1.  A GitHub/Auto-Grader section (60% of exam grade) will consist of four
    programming problems. Each problem will have a time limit to complete.

2.  A [Blackboard](https://csuniv.blackboard.com/) section (40% of exam grade) 
    will consist of standard essay/short answer questions. This part is closed
    book, closed notes, closed internet, etc.

> [!NOTE]
> In-person students must take part 1 of the exam in class on the scheduled due date.

The exam will consist of programming problems, understanding checks, and
analysis of algorithms (showing the state at each step) through Blackboard. 
Additionally, there will be some concept questions on Blackboard. I will be 
grading the logic/concepts (style, clarity, performance, etc.) of your code and 
your ability to perform analysis of code/algorithms. It is in your best interest 
to be verbose so I can award as many points as possible. I'm looking for 
logic/concepts as well as the style, clarity, and performance of your code.

The material will cover what we have discussed so far, including:

-   arrays,
-   Big-O analysis, 
-   operator overloading,
-   pointers,
-   recursion
-   searching,
-   singly/doubly linked lists,
-   sorting (Bubble, Selection, Insertion, Quick, Merge),
-   stacks and queues, 
-   static/stack/heap memory, and
-   templates.

Example Problem 1
-----------------

`DoubleList` is a doubly-linked list that has both head and tail pointers (to 
the beginning and end of the list respectively):

```cpp
class DoubleList {

public:
  DoubleList() : head(nullptr), tail(nullptr) {}
  bool insertEnd(int val);
  bool insertSorted(int val);
  void mergeSortedLists(DoubleList* otherList);

private:
  struct Node {

    //Note: Use of this constructor is optional
    Node (int d=0, Node *n=nullptr, Node *p=nullptr)
        : data(d), next(n), prev(p) {}

    int data;
    Node *pNext, *pPrev;
  };
  Node *pHead, *pTail;
};
```

(14 points) Implement the `mergeSortedLists` member function merges the list
from the parameter into the member list so that the values are sorted. This
function should not create new nodes but instead move the nodes from the
parameter list into the correct positions in the member list. Therefore,
the parameter list will be empty when the function returns.

```cpp
void DoubleList::mergeSortedLists(const DoubleList* otherList) {
```

Note: We have covered Doubly-Linked Lists and Merge Sort but the exam will
ask you to solve a new problem using what you already know. Therefore, on
the exam I may add a twist to the data structure.

Example Problem 2
-----------------

Below is another example to be ready for. (You *will* see something like this on
your midterm).

(10 points) Perform Bubble, Selection, or Insertion sort on the following (be 
sure to tell me which sort you are doing *AND* show each step):

| **2** | **8** | **9** | **0** | **5** | **6** | **1** | **3** | **4** | **7** |
|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |
|   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |   .   |

(10 points) Using the same set of data perform Quick or Merge sort. Why was it
faster?

Exam Strategy
-------------

Some things to keep in mind for the Auto-Graded section:

-   The exam1-0 problem will not count for a grade and should be used as 
    practice before attempting the other problems.

-   Generative AI is prohibited. Before starting, uninstall any AI extensions 
    VS Code and close out any Internet tabs for ChatGPT, etc.

-   You may refer to any of the files in the course repository including your
    solutions to this semester’s labs and projects.

-   There are different time limits for each problem. Finishing a problem early
    doesn't give you more time for the other problems. I recommend starting a 
    timer on your phone/computer so you know when you are nearing the deadline
    after starting.

-   Each question has a set of test cases to pass. Your grade will be based on
    the percentage of test cases you pass. Consider what additional
    test cases you may need to consider as you manage your time.

-   Make sure your last submission is your best.

-   You may submit for testing as many times as you wish.
