Calculator practice take home problem:

---
Build a command line calculator that accepts text input, e.g. "1+4*3-4," and prints out the numeric answer. The calculator must support addition, subtraction, multiplication, and division of whole numbers.
---

BEFORE I START 

This is not a terribly complicated problem, so the name of the game here is to create a calculator that uses organized, clean code. I want to be sure my answer is complete and demonstrates my knowledge of core programming principles without becoming overly complicated. The calculator should be modular, in that it can be altered to accept different parameters without the whole thing coming crashing down.

Since we have a discrete input, that seems like a good place to start. A user will input a string of numbers and math operators that include + - / * . The problem does not specify parentheses, so I'll assume they aren't being used. That sounds like a good bonus challenge if I have the time though.

What else do we know about this string? Each operation will contain 2 numbers and an operator. This means the string can be easily divided up even if the numbers are 2 or more digits. I'll simply have to check if the next character after, say, 2+2 is another digit (2+22) or another operator (2+2+4). 

The main issue here is our old friend, order of operations - A.K.A. PEMDAS. At the moment I'm not dealing with parentheses or exponents (another possible bonus challenge?) so I only have to worry about multiplication/division and addition/subtraction. 

My first thought is that the calculator should iterate through the string and "solve" multiplication and division before other operations, and replace 4*3 with 12. So our example "1+4*3-4" becomes "1+12-4". Once multiplication and division are solved, whatever we're using to iterate through the string will solve the input and return our final number.

I want this process to continue until I am only left with a number and no more operators. That sounds like a base case to me, which makes me think a recursively called function could be a good way to solve this.

I could also use a simple "until" statement, that runs until we are left with a single number. However, I would love to practice using recursion so that's how I'll roll.

First I want to ensure I can actually get the input, so I set up a gets.chomp with a simple prompt, with the mechanics of the calculator stored in a Calculator class. I can already tell I will get tired testing the input and output manually, so my thoughts immediately go to setting up some specs to test for me. Since a working calculator will have an exact, expected output, specs seem like a great idea to me. 

AFTER I'M FINISHED

Well, that went pretty well! My calculator is a bit more verbose than some of the other versions I looked up after the fact, but mine is a bit more flexible than I thought it would be. It can return negative numbers and decimals (long decimals, even!), both things ruby and other programming languages can be a little weird about. It took some fiddling with floats and telling my calculator not to recognize negative 2 as minus 2! 

The specs were extremely helpful and I'm glad I made them. Testing each case individually is tiresome and error-prone, and utterly impractical if this was an actual customer facing product requiring hundreds or thousands of tests. 

My initial plan held up. Recursion was a great choice, and my idea to simplifly my input string until it was a single number worked well. 

WHAT'S NEXT?

So the calculator can return negative numbers but currently can't accept them. As I noted earlier I could also include exponents and parentheses. I could build a simple calculator interface, as well. One of the joys of programming is that there are so many different ways to expand and improve a project. If this were a true take home test for an application