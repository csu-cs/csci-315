Testing and Unit Testing
========================

<div class="youtube">
<div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/7BpjfieTFsk?rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
</div>

## Learning Outcomes

After completing this lecture and the related lab, students will be able to:

- **Explain:** Articulate the purpose of testing, differences between unit testing and other testing types, and why tests improve developer productivity.
- **Design Tests:** Design effective unit tests including normal cases, edge cases, and failure cases.
- **Write Tests:** Write unit tests using Doctest and use common test macros/assertions.
- **Interpret Results:** Run tests, read test output, and diagnose failing tests to locate defects.
- **Automate:** Integrate tests into a simple automated workflow using Makefiles.
- **Use Test-First Practices:** Apply basic test-driven development to guide incremental implementation.
- **Debug & Prevent Regressions:** Create regression tests for fixed bugs and use tests to prevent regressions.

## Ethics Essay on the Importance of Testing

Review the instructions for the ethics essay today!

## Test Your Code

***Testing will make you more productive.***  
Meaning, you will spend less time working on problems because you will...

- increase your chances of getting it right the first time AND

- rarely make the same mistake twice.

### Warning

- A computer program *cannot* sufficiently generate test cases for your
  code.

- [The Halting Problem](https://en.wikipedia.org/wiki/Halting_problem):
  Alan Turing proved that it is impossible for a computer to determine
  if any program halts (finishes).  
  Watch this explanation video.

  <div class="youtube">
  <div><iframe width="853" height="480" src="https://www.youtube-nocookie.com/embed/92WHN-pAFCs?start=14&amp;rel=0&amp;showinfo=0" title="CSCI 315" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen="allowfullscreen"></iframe></div>
  </div>

  -  Optionally, check out this related video: [Math's Fundamental Flaw](https://www.youtube.com/watch?v=HeQX2HjkcNo). This video is optional to watch, but fascinating.

- If we don’t know if it halts, how can we test?

- This is your job, and an advantage you have over computation.

### Unit Test

- For this course, unit testing is sufficient.

- There are many other forms of testing, but this course focuses on
  (relatively) small units of code.

- There are numerous unit-testing tools, but no *de facto* standard for
  C++.

  - Unlike Java’s JUnit

- Popular testing frameworks for C++ include
  [GoogleTest](https://google.github.io/googletest/),
  [Boost.Test](https://www.boost.org/doc/libs/1_81_0/libs/test/doc/html/index.html),
  [CppUnit](https://freedesktop.org/wiki/Software/cppunit/),
  [CxxTest](https://cxxtest.com/), and
  [Catch2](https://github.com/catchorg/Catch2).

### Doctest – Unit Testing for C++

- We will use [Doctest](https://github.com/doctest/doctest#readme) for
  this course.

  - Doctest is simple, yet has a rich feature set.

- You only need to place the one file,
  [doctest.h](https://github.com/doctest/doctest/blob/master/doctest/doctest.h?raw=true),
  in your test repository.

- I have provided a full template in class-code.  
  Take a look in the git repository.

## Regression Testing

Regression testing focuses on preventing previously fixed bugs from reappearing by adding automated tests that reproduce the bug. With Doctest, write a focused `TEST_CASE` that encodes the failing scenario (use `CHECK`/`REQUIRE` to assert expected behavior), commit the test alongside the fix, and include it in your test suite so CI or the auto-grader will catch regressions.

Example:

```cpp
// Regression test: previously failed on empty input
TEST_CASE("handle empty input") {
  CHECK_EQ(handle(""), expectedValue);
}
```

Keep regression tests small, deterministic, and fast so they reliably prevent regressions without slowing development.

## Lab 5

### Auto-Grader

- An auto-grader will provide a grade for most of the labs (starting in
  Lab 5).

  - It will not say what test cases you failed.

  - It may not mention if there is a timeout.

  - It may not say if there are compilation errors.

  - It *may* tell you which part of the lab you got right or wrong.

- Test cases from the auto-grader will **NOT** be disclose. You **must**
  learn how to write your own test cases!

- The grade from the auto-grader should be pushed to your repository
  shortly after you push your solution.

### Lab 5: A Review of C++ Arrays

Let’s talk about Lab 5.
