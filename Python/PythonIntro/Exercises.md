---
jupyter:
  jupytext:
    formats: ipynb,md,py
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.0'
      jupytext_version: 0.8.6
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

# Introduction to Python exercise solutions


## Exercise: Reading text from a file and splitting
*Alice's Adventures in Wonderland* is full of memorable characters. The main characters from the story are listed, one-per-line, in the file named `Characters.txt`.

NOTE: we will not always explicitly demonstrate everything you need to know in order to complete an exercise. Instead we focus on teaching you how to discover available methods and how use the help function to learn how to use them. It is expected that you will spend some time during the exercises looking for appropriate methods and perhaps reading documentation.

```python
# 1. Open the `Characters.txt` file and read its contents.

```

```python
# 2. Split text on newlines to produce a list with one element per line.
#    Store the result as "alice_characters".

```


## Exercise: count the number of main characters
So far we've learned that there are 12 chapters, around 830 paragraphs, and about 26 thousand words in *Alice's Adventures in Wonderland*. Along the way we've also learned how to open a file and read its contents, split strings,  calculate the length of objects, discover methods for string and list objects, and index/subset lists in Python. Now it is time for you to put these skills to use to learn something about the main characters in the story.

```python
# 1. Count the number of main characters in the story (i.e., get the length
#    of the list you created in previous exercise).

```

```python
# 2. Extract and print just the first character from the list you created in
#    the previous exercise.

```

```python
# 3. (BONUS, optional): Sort the list you created in step 2 alphabetically, and then extract the last element.

```


## Exercise: Iterating and counting things
Now that we know how to iterate using for-loops and list comprehensions the possibilities really start to open up. For example, we can use these techniques to count the number of times each character appears in the story.

```python
# 1. Make sure you have both the text and the list of characters.
#
# Open and read both "Alice_in_wonderland.txt" and
# "Characters.txt" if you have not already done so.


```

```python
# 2. Which chapter has the most words?
#
# Split the text into chaptes (i.e., split on "CHAPTER ")
# and use a for-loop or list comprehension to iterate over
# the chapters. For each chapter, split it into words and 
# calculate the length.


```

```python
# 3. How many times is each character mentioned in the text?

# Iterate over the list of characters using a for-loop or 
# list comprehension. For each character, call the count method
# with that character as the argument.


```

```python
# 4. (BONUS, optional): Put the character counts computed 
#    above in a dictionary with character names as the keys and 
#    counts as the values.


```

```python
# 5. (BONUS, optional): Use a nested for-loop or nested comprehension 
#    to calculate the number of times each character is mentioned 
#    in each chapter.


```
