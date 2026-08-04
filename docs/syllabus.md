---
head:
  - - style
    - type: 'text/css'
    - '#pdf { display: inline-block;position: relative; left: 50%; transform: translateX(-50%); margin-top:0.5em; padding: 3px 6px; font-size: 14pt; background-color: var(--vp-button-brand-bg); border: var(--vp-button-brand-border) 1px solid; border-radius: 5px; color: var(--vp-button-brand-text);}'
schedule_start_date: "2026-08-24"
start_week: 1
date: "Fall of 2026"
---

Syllabus \| CSCI 315 *Data Structure Analysis*
==============================================

![Charleston Southern University](images/csu_logo.svg){.light-only}

![Charleston Southern University](images/csu_logo-dark.svg){.dark-only}

[Download Printable Version](syllabus.pdf){download="Syllabus-CSCI315.pdf" id="pdf"}

General Information
-------------------

**Department**: Computer Science  
**Course Name**: Data Structure Analysis  
**Course Number**: CSCI 315  
**Credit Hours**: 4 credit hours; 3 lecture hours and 2 laboratory hours.  
**Approved Major Credit**: BS in Computer Science, BS in Cybersecurity, BA in
Applied Computing, BT in Computer Science, and BT in Cybersecurity  
**LAC Requirement**: None  
**Prerequisites**: CSCI 325 with a grade of ‘C’ or better.

Course Description
------------------

The effective application of data structures and abstract data types. Abstract
data types studied include lists, stacks, queues, and trees. Implementation
methods include arrays, classes, pointers, and recursion. Analysis methods
include Big-O notation using induction and recurrence relations. Topics also
include ethical issues in computer science. (C++ is currently used.)

### Motivation

This course is designed to teach you many of the basic data structures used in
computer science. You will learn how to make them, use them, and analyze them.
In addition, you will see how to apply them to novel problems using careful
analysis of the problem to determine which data structure is best suited. Coding
will be done in C++, but the concepts are not language-dependent.

This course is one of the most important in the major. Projects will require a
level of design that is new to your programming career and will help to prepare
you for real-world jobs. The ‘toolbox’ this class will provide you will be used
throughout your programming future. The course serves as a gateway to many
advanced courses. CSCI 315 is a *demanding* course, expect more work than
previous courses. The projects in this class are more involved, requiring a
deeper understanding of Computer Science. Learning to design and manage large
projects is a core concept of the degree.

Course Materials
----------------

### Required Textbook

Malik, D. S. (2018). [C++ Programming: Program Design Including Data
Structures](https://www.cengage.com/c/student/9781337117562/). 8th edition. Stamford,
CT: Cengage Learning. ISBN: 978-1-337-11756-2. *You may also choose to purchase
the cheaper 7th edition for this course.*

### Other Required Materials

This course relies on [GitHub](https://github.com/). Assignments and
lectures are located on GitHub at
<https://github.com/csu-cs/CSCI-315-2026-Fall>. If you cannot access it,
please email me so I can grant you access.

Student Learning Outcomes
-------------------------

By the conclusion of this course, students will be able to:

| **#** | **Student Learning Outcome** | **ABET-CAC SLO Alignment** |
|:-:|:-------------------------------------------------------|:-----------:|
| 1 | Navigate a Unix/Linux environment using command-line interface tools, compile C++ programs using compiler tools (like GCC/Clang and Makefiles), and manage source code repositories using Git. | 2, 6 |
| 2 | Allocate, manage, and deallocate memory dynamically in C++, and utilize diagnostic tools to detect and resolve memory leaks, segmentation faults, and pointer errors. | 2, 6 |
| 3 | Design and execute automated unit tests that cover normal, edge, and failure cases to verify software correctness and prevent regressions. | 2 |
| 4 | Implement robust software components in C++ using core object-oriented principles, including classes, encapsulation, inheritance, operator overloading, and templates (parametric polymorphism). | 2, 6 |
| 5 | Quantify and compare the computational efficiency of algorithms and data structures analytically using Big-O notation, recurrence relations, and induction, as well as empirically through execution timing. | 1, 6 |
| 6 | Implement and manipulate basic linear data structures, including singly-linked lists, doubly-linked lists, stacks, and queues. | 2, 6 |
| 7 | Implement and manipulate hierarchical and specialized trees, including Binary Search Trees (BST), Heaps, B-Trees, and Quadtrees. | 2, 6 |
| 8 | Represent graphs using adjacency lists and adjacency matrices, and apply graph search algorithms (Depth-First Search and Breadth-First Search) to solve pathfinding and spatial search problems. | 1, 2, 6 |
| 9 | Select, implement, and evaluate quadratic (bubble, selection, insertion) and divide-and-conquer (merge, quick) sorting algorithms, along with linear and binary search methods. | 1, 2, 6 |
| 10 | Design and implement hash tables, analyzing the performance tradeoffs between chaining and open-addressing collision resolution strategies. | 1, 2, 6 |
| 11 | Appropriately integrate standard containers, iterators, and generic algorithms from the C++ Standard Template Library (STL) to construct efficient software systems. | 2, 6 |
| 12 | Evaluate the ethical, legal, and professional implications of computing practices, particularly regarding software reliability, testing standards, and academic integrity. | 4 |

### ABET-CAC Student Outcomes Reference

The following ABET Computing Accreditation Commission (CAC) student
outcomes are supported by this course. Students completing this course
will have the ability to:

| **#** | **Student Learning Outcome**                             |
|---|------------------------------------------------------|
| 1 | Analyze a complex computing problem and apply principles of computing and other relevant disciplines to identify solutions. |
| 2 | Design, implement, and evaluate a computing-based solution to meet a given set of computing requirements in the context of the program’s discipline. |
| 3 | Communicate effectively in a variety of professional contexts. |
| 4 | Recognize professional responsibilities and make informed judgments in computing practice based on legal and ethical principles. |
| 6 | Apply computer science theory and software development fundamentals to produce computing-based solutions. |

Tentative Weekly Schedule
-------------------------

The weekly schedule is subject to change. **Those who keep up with the work generally do well.**

| Day        | Lectures                                      | Related Assignment |
|:----------:|-----------------------------------------------|--------------------|
|  1A  | [Introduction](/lectures/01-introduction) and [Unix/Linux Commands](/lectures/01-basic-unix) | Lab 01                |
|  1B  | [C++ Compilation is Linux](/lectures/02-unix-compilation)  | Lab 02                |
|  2A  | [Memory Management](/lectures/03-memory-management) | Lab 03                |
|  2B  | [Pointers](/lectures/04-pointers) and [Testing](/lectures/04-testing) | Lab 04, 05, & Ethics  |
|  3A  | [C++ Object-Oriented Programming](/lectures/05-oop) |                       |
|  3B  | [Operator Overloading](/lectures/06-operator-overloading) and [Templates](/lectures/06-templates)  | Lab 06                |
|  4A  | [Empirical Analysis](/lectures/07-empirical-analysis) and [Analytical Analysis](/lectures/07-analytical-analysis) | Lab 07                |
|  4B  | [Linked Lists](/lectures/08-linked-lists) | Lab 08                |
|  5A  | [Debugging](/lectures/09-debugging) and [Doubly-Linked Lists, & the STL](/lectures/09-doubly-linked-lists) | Project 1 & Lab 09    |
|  5B  | [Search](/lectures/10-search) and [Quadratic Sorting](/lectures/10-quadratic-sort) | Lab 10                |
|  6A  | [Quick Sort](/lectures/11-quick-sort) and [Merge Sort](/lectures/11-merge-sort) | Lab 11                |
|  6B  | [Stacks](/lectures/12-stacks), [Queues](/lectures/12-queues), [Midterm Study Guide](/guides/midterm-study-guide) | Lab 12                |
|  7A  | [Depth- and Breadth-First Search (2D Maze Search)](/lectures/13-2D-search) | [Project 2](/lectures/13-project2) & Lab 13    |
|  7B  | Midterm Exam                                |                       |
|  8A  | *Fall Break* (No Class)                     |                       |
|  8B  | Binary Search Trees: [Insertion, Search](/lectures/14-binary-trees-1) and [Intro to Traversal](/lectures/14-binary-trees-traversal) | Lab 14                |
|  9A  | Binary Search Trees: [Deletion](/lectures/15-binary-trees-delete) and [Generic Traversal](/lectures/15-binary-trees-traversal) | Lab 15                |
|  9B  | [Heaps & Heapsort](/lectures/16-heaps-heapsort) | Lab 16                |
| 10A  | [STL Containers and Iterators](/lectures/17-stl-containers) and [STL Algorithms](/lectures/17-stl-algorithms) | Lab 17                |
| 10B  | [Hash Tables via Chaining](/lectures/18-hash-tables-chaining) | Lab 18                |
| 11A  | [Project 3](/lectures/19-project3) and [Hash Tables via Open-Addressing](/lectures/19-hash-tables-open-addressing) | [Project 3](/lectures/19-project3) & Lab 19    |
| 11B  | [Priority Queues](/lectures/20-priority-queues) | Lab 20                |
| 12A  | [B-Trees](/lectures/21-b-trees) | Lab 21                |
| 12B  | [Graphs via Adjacency Matrices](/lectures/22-graphs-adjacency-matrices) | Lab 22                |
| 13A  | [Graphs via Adjacency Lists](/lectures/23-graphs-adjacency-lists) | Lab 23                |
| 13B  | [Quadtrees](/lectures/24-quadtrees) | Lab 24                |
| 14A  | [Brainstorm Optimizations for Project 3](/lectures/25-project3) |  |
| 14B  | *Thanksgiving* (No Class) | |
| 15A  | [Comparison of Data-Structure Performance](/lectures/26-review)    |        |
| 15B  | [Final Exam (Part 1)](/guides/final-study-guide)    |           |
| 16B  | [Final Exam (Part 2)](/guides/final-study-guide) at 10:30 a.m. [per the official exam schedule](https://www.charlestonsouthern.edu/academics/academic-calendar/) |  |

{#schedule-table}

### Online Students

Be aware that the lack of scheduled face-to-face communication puts online
students at a disadvantage. Therefore, communication is paramount. I will
answer email during office hours. Please keep assignment due dates in mind,
because there may be a delay in my response time. In short, get started early
and stay ahead!

#### Video Recording of Lectures

I will video-record my in-class lectures and post the links on [the course
website](https://csu-cs.github.io/csci-315/). These recordings are for online
students so they can review the material. Lecture videos from the previous
semester are currently posted so you can work ahead.

Grading
-------

The assessment categories are weighted as follows.

| Task         | Percentage |
|-------------:|-----------:|
| Ethics Paper |  5%        |
| Labs         | 36%        |
| Projects     | 30%        |
| Midterm      | 14%        |
| Final        | 15%        |

### Grading Scale for Letter Grade

Final letter grades will be calculated using the following ranges.

| Letter Grade | Grade Range % | Grade Points per Credit |
|:-------------|:--------------|:------------------------|
| A            | 90% and 100%  | 4.0                     |
| B+           | 87% and < 90% | 3.5                     |
| B            | 80% and < 87% | 3.0                     |
| C+           | 77% and < 80% | 2.5                     |
| C            | 70% and < 77% | 2.0                     |
| D            | 60% and < 70% | 1.0                     |
| F            | less than 60% | 0                       |
| FA           | Failure for Absences | 0                |
| FD           | Academic Dishonesty | 0                 |

### Late Work

If a lab or project is submitted within 7 days of the deadline and before the
last day of class, the work will earn 80% credit. After 7 days, the work will
earn 0% credit. Late work will **not** be accepted after the final day of
class (before finals). Exams and papers may **not** be submitted late.

### Teamwork and Assistance

There are no group projects in this course. All work is to be completed
individually without any assistance from students, online tutoring, generative 
AI, or other services. You may seek help from your professor.

Because this class is difficult, do not allow yourself to fall behind. There is
a significant snowball potential. Significantly more work is required compared
to previous classes. Expect to put *many* hours into the projects (10, 20, or
30 hours depending on your skill). **Do not** wait until the last moment. **Do**
come to me for help during office hours. **Do** discuss your designs and ideas
with me and not just your programming bugs.

Attendance
----------

Student participation is crucial for academic success. Students are also
expected to check their BucMail daily and review Blackboard for course
announcements.

### In-Person

Any student who misses 25% of course meetings will be awarded a grade of FA
(Failure due to Absences). In this course, **FA is awarded after missing 7 class
meetings**. Three (3) instances of tardiness or leaving class early are equal to
one absence. For more information, please see the [CSU Excessive Absence
Policy](https://www.charlestonsouthern.edu/wp-content/uploads/policy-r-10-revised-sept-2025.pdf).
If you arrive after the roll is called, check in with the professor directly
after class so that you will be recorded as tardy instead of absent.

### Online

Students are expected to log in to their course(s) daily, watch lecture videos,
and complete readings and assignments. Students are also expected to check their
BUCmail daily.

Any student who does not **participate** in this course's academic activities
for 28 consecutive days will be awarded a grade of FA (Failure due to Absences).
Academic activities include completing assignments, quizzes, and exams (simply
logging in does **not** count as attendance). For more information, please see
[CSU's Excessive Absences
policy](https://www.charlestonsouthern.edu/wp-content/uploads/policy-r-10-revised-sept-2025.pdf).

Course, Department, and University Policies
-------------------------------------------

### Academic Integrity and the Honor Code

All students are expected to adhere to [Charleston Southern University's 
Academic Integrity 
Policy](https://www.charlestonsouthern.edu/wp-content/uploads/CSU-Policy-R-58-updated-April-2026.pdf) 
and the [Computer Science Departmental 
Guidelines](/integrity). **All assignments** 
are individual assignments unless explicitly specified by the professor. Do not 
collaborate, search for posted solutions, or post code online. **Make sure that 
you write every line of your own code.** You should not use **ANY** outside 
sources of code. Referencing code written by someone else (including AI) or 
sharing your code with others (online or in-person) is considered a violation 
of the Academic Integrity Policy and will be reported to the registrar's 
office. **Publicly posting code related to assignments is prohibited** (e.g., 
**don't** post to forums, blogs, public repositories, chegg.com, etc.).  Do NOT 
look at your neighbor's screen for hints or ask, "how did you do that?", unless 
you talk to me **beforehand**.

-   **NEVER** look at someone else's code in person or online (chegg.com,
    forums, email, etc.).  
    **Do** ask your professor if you have questions or get stuck.

-   **NEVER** search online for assignment solutions.  
    **Do** reference code from the book, code given to you by the instructor,
    and online documentation on the C++ language.

-   **NEVER** exchange code in any manner, or you tell someone what code they
    need.  
    **You may** talk to your classmates about C++ or assignments if you
    are not sharing ideas for assignment solutions.

-   **NEVER** use an AI tool to generate code for use in an assignment or exam
    without explicit permission from the instructor for that particular task. As
    an example, Visual Studio Code extensions that generate code (like GitHub 
    Copile, Tabnine, and Cody) are prohibited.  
    **You may** use AI to help explain concepts or study before exams, 
    but not for any use for planning, debugging, developing, or any other use 
    for assignments, exams, or other assessments.

### AI Policy for CSCI 315

**Level 1: Use of generative AI is *prohibited* in this course.**

To ensure mastery of the concepts and skills in this course, the use of
generative artificial intelligence (AI) tools is prohibited. Students who are
unsure of this policy or any assignment-specific directions, including whether
a given technology is considered AI, should consult the course instructor
before using such technology to complete their assignment.

While proper AI use is an important skill that will be emphasized in
other courses, AI misuse short-circuits the learning process to give the
illusion of proficiency without the necessary depth. It is unethical to
take full credit for work created with the help of AI. This principle is
the same as using someone else’s idea without citing it.

[Review the departmental policies for AI use in Computer Science
coursework.](/integrity#artificial-intelligence-ai)

[Click here for additional guidance on academic integrity for Computer Science
coursework.](/integrity)

### A Community of Honor

> As a liberal arts university committed to the Christian faith, Charleston 
> Southern University seeks to develop ethical men and women of disciplined, 
> creative minds and lives, focusing on leadership, service, and learning. The 
> Honor System of Charleston Southern University is designed to provide an 
> academic community of trust in which students can enjoy the opportunity to 
> grow both intellectually and personally. For these purposes, the following 
> rules and guidelines will be applied.

### Academic Dishonesty

> “*Academic Dishonesty*” is the transfer, receipt, or use of academic 
> information, or the attempted transfer, receipt, or use of academic 
> information in a manner not authorized by the instructor or by university 
> rules. It includes, but is not limited to, cheating, plagiarism, and forgery 
> as well as aiding or encouraging another to commit academic dishonesty.

> “*Cheating*” is defined as wrongfully giving, taking, or presenting any 
> information or material borrowed from another source (including the Internet) 
> by a student with the intent of aiding themself or another in academic work. 
> This includes, but is not limited to, a test, examination, presentation, 
> experiment, or any written assignment, which is considered in any way in the 
> determination of the final grade. Using AI in violation of a course or 
> assessment’s stated AI protocol is cheating.

> “*Plagiarism*” is the taking or attempted taking of an idea, a writing, a 
> graphic, music composition, art, or datum of another person or Artificial 
> Intelligence (AI) tool without giving proper credit and presenting or 
> attempting to present it as one's own, with or without intent. It is also 
> taking written material of one's own that have been used for a previous 
> course assignment and using it without reference to it in its original form. 
> Any use of AI models without proper citation is plagiarism.

> Students are encouraged to ask their instructor(s) for clarification 
> regarding their academic dishonesty standards. Instructors will include 
> academic dishonesty/integrity standards, including explicit permissible AI 
> use, on their course syllabi and each individual assignment.

Violations of this policy will result in academic discipline, up to and
including expulsion from the University.

For more information on procedures and violation appeals, refer to the [Student
Handbook](https://www.charlestonsouthern.edu/current-students/student-resources/).

### Course Evaluations

To pursue our mission of *Academic Excellence in a Christian Environment*, we
must receive feedback from students. The student feedback survey is online and
will be available to students in the second half of the semester. Students are
strongly encouraged to complete the short evaluation survey, which is anonymous.
Your professor will let you know when the survey is available. The survey will
be available through your MyCSU account. We greatly value your opinion!

### Student Representatives

These are students who are designated by letter to represent the University in 
official business (e.g., athletic, music, and similar events). If officially 
scheduled absences cause these students to miss tests, assignments, or similar 
academic activities, university policy allows these to be made up without 
penalty. Student Representatives may opt to either make-up tests *before* 
departure or supplant missed tests with the final exam grade. Final exams 
must always be taken *before* departure to avoid an Incomplete for the course. 
Scheduled assignments remain subject to the lateness policy and must be turned 
in before departure to avoid lateness penalties. Student Representatives are 
responsible for informing the instructor of official absences and to make all 
appropriate arrangements.

### Internet Etiquette

Charleston Southern University (CSU) holds students, faculty, and staff to the
highest standards of conduct and expects to demonstrate courteous behaviors and
practices in online communications. This policy includes guidelines and
recommendations for online communications. Being respectful, thoughtful,
meaningful, and ethical are fundamental to good netiquette.

CSU's basic netiquette rules are:

-   Course communications are for internal use only and are considered
    confidential. Do not forward or quote discussion posts, emails, or other
    course communications to outside parties.

-   Never share personal login usernames, IDs, or passwords.

-   Do not type in all capital letters. It is perceived online as shouting.

-   Use proper capitalization, grammar, spelling, and punctuation conventions
    for professional communications.

-   Avoid texting jargon or abbreviations without explanation.

    -   Incorrect: "CSU is a wonderful university."

    -   Correct: "Charleston Southern University (CSU) is a wonderful
        university."

-   Be mindful of sending emails. Ensure that content is relevant and pay
    attention to *Reply* versus *Reply All*.

-   BucMail is the only email allowed for course communications. Other platforms
    (Yahoo, Gmail, etc.) are prohibited.

-   In video conferencing, mute your microphone when not speaking.

-   Differing views are natural and welcome in discussion boards. Be respectful
    in your comments, even if you disagree or dislike someone's position on a
    topic.

-   Respect the time and availability of students, faculty, and staff. Emails
    should be addressed within one business day. Remember that
    traditional faculty work hours are 8 a.m. - 5 p.m. EST.

### Accessibility Services

Any student who may need accommodations should review the requirements/procedures on the [Accessibility Services website](https://www.charlestonsouthern.edu/student-life/student-support/student-success/accessibility-services/). Once approved to receive accommodations, the student must contact the instructor.

### Title IX: Confidentiality and Responsible Employee Statement
Charleston Southern University is committed to maintaining a safe learning environment for everyone. In accordance with Title IX of the Education Amendments of 1972, the university prohibits any form of sexual harassment, including quid pro quo harassment, hostile environments, sexual assault, dating/domestic violence, and stalking. This policy applies to all students, employees, and visitors.

Additionally, Title IX prohibits discrimination against students based on pregnancy, childbirth, false pregnancy, termination of pregnancy, or recovery from these conditions. Pregnant or parenting students may receive accommodations to ensure their full participation in educational programs. These adjustments can be arranged through the university’s Title IX Coordinator or their designee.

Under Charleston Southern University’s Title IX Policy, all faculty members, including teaching assistants, are required to report any disclosures of sex or gender-based discrimination or violence to the Title IX Coordinator. The Title IX Coordinator will provide support and resources while maintaining privacy. If you or someone you know needs assistance, please contact the Title IX Coordinator:

Summer Cora  
(843)-863-7374  
<titleix@csuniv.edu>  
Office Location: 2nd floor of the Student Center

Please visit the [CSU Title IX webpage](https://www.charlestonsouthern.edu/offices/title-ix/) for more information on Title IX procedures, anonymous reporting, or available support.

---

See all course, department, and university policies located in
[Blackboard](https://csuniv.blackboard.com) and the [CSU Student
Handbook](https://www.charlestonsouthern.edu/current-students/student-resources/).

<script setup>
import { onMounted } from 'vue';
import { useData } from 'vitepress';
import { appendScheduleDates } from '/.vitepress/theme/appendScheduleDates.js';

const { frontmatter } = useData();

onMounted(() => {
    appendScheduleDates(frontmatter.value.schedule_start_date);
});
</script>