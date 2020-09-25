1)Acronym
Introduction

Convert a phrase to its acronym.

Techies love their TLA (Three Letter Acronyms)!

Help generate some jargon by writing a program that converts a long name like Portable Network Graphics to its acronym (PNG).



2)Matrix
Introduction

Given a string representing a matrix of numbers, return the rows and columns of that matrix.

So given a string with embedded newlines like:

9 8 7
5 3 2
6 6 7
representing this matrix:

    0  1  2
  |---------
0 | 9  8  7
1 | 5  3  2
2 | 6  6  7
your code should be able to spit out:

A list of the rows, reading each row left-to-right while moving top-to-bottom across the rows,
A list of the columns, reading each column top-to-bottom while moving from left-to-right.
The rows for our example matrix:

9, 8, 7
5, 3, 2
6, 6, 7
And its columns:

9, 5, 6
8, 3, 6
7, 2, 7

3)Meetup
Calculate the date of meetups.

Typically meetups happen on the same day of the week. In this exercise, you will take a description of a meetup date, and return the actual meetup date.

Examples of general descriptions are:

The first Monday of January 2017
The third Tuesday of January 2017
The wednesteenth of January 2017
The last Thursday of January 2017
The descriptors you are expected to parse are: first, second, third, fourth, fifth, last, monteenth, tuesteenth, wednesteenth, thursteenth, friteenth, saturteenth, sunteenth

Note that "monteenth", "tuesteenth", etc are all made up words. There was a meetup whose members realized that there are exactly 7 numbered days in a month that end in '-teenth'. Therefore, one is guaranteed that each day of the week (Monday, Tuesday, ...) will have exactly one date that is named with '-teenth' in every month.

Given examples of a meetup dates, each containing a month, day, year, and descriptor calculate the date of the actual meetup. For example, if given "The first Monday of January 2017", the correct meetup date is 2017/1/2.
