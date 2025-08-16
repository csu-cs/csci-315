---
head:
  - - style
    - type: 'text/css'
    - '#pdf { display: inline-block;position: relative; left: 50%; transform: translateX(-50%);;margin-top:0.5em; padding: 3px 6px; font-size: 14pt; background-color: var(--vp-button-brand-bg); border: var(--vp-button-brand-border) 1px solid; border-radius: 5px; color: var(--vp-button-brand-text);}'
---

Syllabus \| CSCI 315 *Data Structure Analysis*
==============================================

![Charleston Southern University](images/csu_logo.svg){.light-only}

![Charleston Southern University](images/csu_logo-dark.svg){.dark-only}

[Download Printable Version](syllabus.pdf){download="Syllabus-CSCI315.pdf" id="pdf"}

General Information
-------------------

Department: Computer Science  
Course Name: Data Structure Analysis Course Number: CSCI 315  
Credit Hours: 4 credit hours; 3 lecture hours & 2 laboratory hours.  
Approved Major Credit: BS in Computer Science, BS in Cybersecurity, BA in
Applied Computing, BT in Computer Science, and BT in Cybersecurity  
LAC Requirement: None  
Prerequisites: CSCI 325 grade of ‘C’ or better

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

This class is driven through [GitHub](https://github.com/). Assignments and
lectures are located on GitHub at
<https://github.com/csu-cs/CSCI-315-2025-Fall>. If you are not able to access
it, please send me an email so I can grant you access.

ABET Learning Outcomes
----------------------

Students completing this course will have an ability to:

1.  Analyze a complex computing problem and to apply principles of computing and
    other relevant disciplines to identify solutions.

2.  Design, implement, and evaluate a computing-based solution to meet a given 
    set of computing requirements in the context of the program’s discipline.

3.  Communicate effectively in a variety of professional contexts.

4.  Recognize professional responsibilities and make informed judgments in 
    computing practice based on legal and ethical principles.

6.  Apply computer science theory and software development fundamentals to 
    produce computing-based solutions.

Objectives and Tasks
--------------------

**From previous experience, those who keep up with the work do well.**

**Section 1 Topics**:  
Unix/Linux topics: Bash, Compilation, Pointers, Memory Management, 
Performance Analysis, Big-O

**Section 2 Topics**:  
Arrays (review), Abstract Data Types (Classes), Linked Lists,
Object-Oriented Programming, Inheritance, Strings.

**Section 3 Topics**:  
Stacks, Queues, Templates, Standard Template Library (STL), Casting, 
Sorting (Insertion, Selection, Mergesort, Quicksort), Streams.

**Section 4 Topics**:  
Recursion, Binary Search Trees (BST), Maps, Heaps, Priority Queues, Heapsort,
Hash tables, Operator Overloads, Graphs.

Tentative Weekly Schedule
-------------------------

The weekly schedule is subject to change.

| Week | Lectures                                    | Related Assignment    |
|------|---------------------------------------------|-----------------------|
|  1A  | [Introduction](/lectures/01-introduction), [Unix Commands](/lectures/01-basic-unix) | Lab 01                |
|  1B  | [C++ Compilation is Linux](/lectures/02-unix-compilation)  | Lab 02                |
|  2A  | [Memory Management](/lectures/03-memory-management) | Lab 03                |
|  2B  | [Pointers and Testing](/lectures/04-pointers-testing) | Lab 04, 05, & Ethics  |
|  3A  | [C++ Object-Oriented Programming](/lectures/05-oop) |                       |
|  3B  | [Operator Overloading and Templates](/lectures/06-operator-overloading-templates)  | Lab 06                |
|  4A  | [Performance Analysis](/lectures/07-performance-analysis) | Lab 07                |
|  4B  | [Linked Lists](/lectures/08-linked-lists) | Lab 08                |
|  5A  | [Debugging, Doubly-Linked Lists, & the STL](/lectures/09-debugging-and-doubly-linked-lists) | Project 1 & Lab 09    |
|  5B  | [Search & Quadratic Sorting](/lectures/10-search-quadratic-sort) | Lab 10                |
|  6A  | [Quick and Merge Sorting](/lectures/11-quick-and-merge-sort) | Lab 11                |
|  6B  | [Stacks & Queues](/lectures/12-stacks-queues), [Midterm Study Guide](/guides/midterm-study-guide) | Lab 12                |
|  7A  | [Depth- and Breadth-First Search (2D Maze Search)](/lectures/13-2D-search) | Project 2 & Lab 13    |
|  7B  | Midterm Exam                                |                       |
|  8A  | *Fall Break* (No Class)                     |                       |
|  8B  | [Binary Search Trees (Part 1)](/lectures/14-binary-trees-1) | Lab 14                |
|  9A  | [Binary Search Trees (Part 2)](/lectures/15-binary-trees-2) | Lab 15                |
|  9B  | [Heaps & Heapsort](/lectures/16-heaps-heapsort) | Lab 16                |
| 10A  | [Standard Template Library](/lectures/17-standard-template-library) | Lab 17                |
| 10B  | [Hash Tables via Chaining](/lectures/18-hash-tables-chaining) | Lab 18                |
| 11A  | [Hash Tables via Open-Addressing](/lectures/19-hash-tables-open-addressing) | Project 3 & Lab 19    |
| 11B  | [Priority Queues](/lectures/20-priority-queues) | Lab 20                |
| 12A  | [B-Trees](/lectures/21-b-trees) | Lab 21                |
| 12B  | [Graphs via Adjacency Matrices](/lectures/22-graphs-adjacency-matrices) | Lab 22                |
| 13A  | [Graphs via Adjacency Lists](/lectures/23-graphs-adjacency-lists) | Lab 23                |
| 13B  | [Quadtrees](/lectures/24-quadtrees) | Lab 24                |
| 14A  | [Brainstorm Optimizations for Project 3](/lectures/25-project3) |                       |
| 14B  | *Thanksgiving Holiday* (No Class)           |                       |
| 15A  | [Comparison of Data-Structure Performance](/lectures/26-review)    | Make-up Work          |
| 16B  | Final Exam on 12/11 at 10:30 a.m. [per the Exam Schedule](https://www.charlestonsouthern.edu/academics/academic-calendar/) |  |

{#schedule-table}

### Online Students

I understand that some students must take this class online. Be aware that the
lack of scheduled face-to-face communication puts online students at a
disadvantage. Therefore, communication is paramount. I will be able to answer
your email during office hours. Please keep the timing of due dates for labs in
mind because there will likely be a delay as I respond to questions. In short,
get started early and stay ahead!

#### Video Recording of Lectures

I will video-record my in-class lectures. After class, I will upload and post a
link on Blackboard. The video recordings are for online students so you can
review the material. If you do not see the content within 24 hours of class,
please email me.

Grading
-------

The assessment categories will be weighted as follows.

| Task         | Percentage |
|-------------:|:----------:|
| Ethics Paper |  5%        |
| Labs         | 36%        |
| Projects     | 30%        |
| Midterm      | 14%        |
| Final        | 15%        |

### Grading Scale for Letter Grade

Letter grades will be calculated from the following ranges.

| Average   | Letter Grade |
|:---------:|--------------|
| 90 – 100  | A            |
| 87 – 89.9 | B+           |
| 86 – 80.9 | B            |
| 77 – 79.9 | C+           |
| 70 – 76.9 | C            |
| 60 – 69.9 | D            |
| below 60  | F            |

### Late Work

If a lab or project is submitted within 7 days of the deadline (and before the
last day of class), the work will earn 80% credit. After 7 days, the work will
earn 0% credit. Late work will **not** be accepted after April 29, 2025. Exams
and papers may **not** be submitted late.

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

### On-Ground

Any student who has missed 25% of course meetings will be awarded a grade of FA
(Failure due to Absences). In this course, **FA is awarded after missing 7 class
meetings**. Three (3) instances of tardiness or leaving class early are equal to
one absence. For more information, please see the [CSU Excessive Absence
Policy](https://www.charlestonsouthern.edu/wp-content/uploads/Policy-R-10-revised-August-2022.pdf).
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
policy](https://www.charlestonsouthern.edu/wp-content/uploads/Policy-R-10-revised-August-2022.pdf).

Course, Department, and University Policies
-------------------------------------------

### Academic Integrity and the Honor Code

All students are expected to adhere to [Charleston Southern University's 
Academic Integrity 
Policy](https://www.charlestonsouthern.edu/wp-content/uploads/Policy-R-58-updated-July-2025.pdf) 
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

### AI Policy for CSCI 235

**Level 1. Use of generative AI is *prohibited* in this course.**

To ensure development and mastery of the concepts and skills in this
course, the use of generative artificial intelligence (AI) tools is
prohibited. Students who are unsure of this policy or any
assignment-specific directions, including whether a given technology is
considered AI, should consult the course instructor before using such
technology to complete their assignment.

While proper AI use is an important skill that will be emphasized in
other courses, AI misuse short-circuits the learning process to give the
illusion of proficiency without the necessary depth. It is unethical to
take full credit for work created with the help of AI. This principle is
the same as using someone else’s idea without citing it. 
[Review the departmental policies for AI use in Computer Science
coursework.](/integrity#artificial-intelligence-ai)

[Click here for additional guidance on academic integrity for Computer Science
coursework.](/integrity)

#### A Community of Honor

>   As a liberal arts university committed to the Christian faith, Charleston
>   Southern University seeks to develop ethical men and women of disciplined,
>   creative minds and lives that focus on leadership, service, and learning.
>   The Honor System of Charleston Southern University is designed to provide an
>   academic community of trust in which students can enjoy the opportunity to
>   grow both intellectually and personally. For these purposes, the following
>   rules and guidelines will be applied.

>   "Academic Dishonesty" is the transfer, receipt, or use of academic 
>   information, or the attempted transfer, receipt, or use of academic 
>   information in a manner not authorized by the instructor or by university 
>   rules. It includes, but is not limited to, cheating, plagiarism and forgery 
>   as well as aiding or encouraging another to commit academic dishonesty.

>   "Cheating" is defined as wrongfully giving, taking, or presenting any 
>   information or material borrowed from another source - including the 
>   Internet by a student with the intent of aiding himself or another on 
>   academic work. This includes, but is not limited to a test, examination, 
>   presentation, experiment, or any written assignment, which is considered in 
>   any way in the determination of the final grade.

>   "Plagiarism" is the taking or attempted taking of an idea, a writing, a 
>   graphic, music composition, art, or datum of another person or the use of 
>   any Artificial Intelligence (AI) platform without giving proper credit and 
>   presenting or attempting to present it as one's own with or without intent. 
>   It is also taking written materials of one's own that have been used for a 
>   previous course assignment and using it without reference to it in its 
>   original form.

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
    should be addressed within 24 hours of receipt. Remember that
    traditional faculty work hours are 8 a.m. - 5 p.m. EST.

### Accessibility Services

Any student who may need accommodations should review the requirements/procedures on the [Accessibility Services website](https://www.charlestonsouthern.edu/academics/student-success-center/accessibility-services/). Once approved to receive accommodations, the student must contact the instructor.

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
import { appendScheduleDates } from '/.vitepress/theme/appendScheduleDates.js';

onMounted(() => {
    appendScheduleDates("2025-08-25");
});
</script>