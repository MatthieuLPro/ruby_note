# Notes on Ruby Language
## Sources:
* Learn ruby
    * https://ruby-doc.org/
    * http://rubylearning.com/
* Keywords
    * https://ruby-doc.org/core-2.3.0/doc/keywords_rdoc.html
* Pre and Post
    * https://www.geeksforgeeks.org/pre-increment-and-post-increment-in-c/
* Synthatic Sugar
    * https://en.wikipedia.org/wiki/Syntactic_sugar
* Barewords
    * https://en.wiktionary.org/wiki/bareword
* Global variables
    * https://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/globalvars.html
* Data types
    * https://en.wikipedia.org/wiki/Primitive_data_type
* Summary
    * http://rubylearning.com/satishtalim/ruby_summary1.html
    * http://rubylearning.com/satishtalim/ruby_summary2.html

## Notes:
#### _Alias_

Creates a new name that refers to an existing method. If the method is 
subsequently redefined, the aliased name will still invoke the original method.
```
def old_method
  "old method"
end

alias new_method old_method

def old_method
  "old improved method"
end

puts old_method # "old improved method"
puts new_method # "old method"
```

#### _Ancestors_

You can get the ancestors of a class using the method ancestors on a class.
```
str = 'Jack'
p str.class.ancestors # [String, Comparable, Object, Kernel, BasicObject]
```

#### _Bang methods_

With the symbol '!' at the end of the method. Those methods modify an object-in-place.
Method without the bang perform an action and return a new object, reflecting the
result of the action. The bang version of the same method perform the action,
but they do so in place: Instead of creating new object, they transform the
original object.

A few non bang methods perform changes on the original object.

#### _Blocks_

Called closures in other languages, are chunks of code between braces or between
do..end.

The code in the block is not executed at the same time it is encountered.
Instead, Ruby remembers the context in which the block appears (local var, 
current object, ...) and then enters the method.

Inside a method, you can call the block using the yield keyword with a value.

#### _Constantes_

A constant name start with an uppercase letter, followed by name characters.
Class names and modules names are constant and follow the constant naming 
convention.
```
module MyMath
PI = 3.1416
class MyPune
MY_CONSTANT = 123
```

#### _Dangerous method_
*See 'Bang methods' part*
A method with an exclamation point or bang is considered as dangerous.

#### _Data types_

* Basic type: Data type provided by a programming language (Fixnum) as a basic building block.
* Built in type: Data type for which the programming language provides built-in support.
* Primitive type: char, int float ...

#### _Environment variable_

![Env variable list](http://rubylearning.com/images/env.jpg "Env variable list")

Setting an environment variable's value to nil removes the variable from the 
environment.

#### _File_

The File.open method can open file in different modes like:
* r  : Read only, starts at beginning
* r+ : Read/Write, starts at beginning
* w  : Write only, truncates existing file to zero length or creates a new file
for writing.

#### _Float_

Subclass of Numeric. DIG is the class constant that gives the max precision of Float
in decimal digits. MAX gives the largest Float.
```
p Float::DIG # 15
p Float::MAX # 1.7976931348623157e+308
p 1.000_000_000_000_001 # 1.000000000000001
p 1.000_000_000_000_000_1 # 1.0
```

#### _Global features_

Some features are:
* Free format
* Case sensitive
* Comments (with # and =begin =end)
* Semicolons are required for only for multiple statements on one line
    * example.length; example.age; example.strength
* Everything is true, except the reserved words **false** and **nil**
* Keywords <=> Reserved words (around 42) cannot be used for other purposes.
* Programme execution, generaly from top to bottom

#### _Hashes_

Sometimes known as 'associative arrays', 'maps' or 'dictionaries'.

When you store a value in a hash, you actually supply two objects: 
* the index (the key)
* the value

Compared with array, hashes have one significant advantage: they can use any
object as an index.

Hashes have a default value. This value is returned when an attempt is made to
access keys that do not exist in the hash. By default, this value is nil.

An exception to the shorter { symbol: value } syntax is when you would like to
use a numeric key:

```
my_hash = { 1: 'one' } # will not work
my_hash = { 1 => 'one' } # will work
```

#### _Input_

* STDOUT: Standard output stream for the program.
* gets: Accept a single line of data from the standard input.
* Standard input: Default stream supplied by many operating systems that relates
to the standard way to accept input from the user (example: Keyboard)
* chomp: String method which return a new string without \n

#### _Interpolation operator_

'#{}' gets calculated separately and the results of the calculation are pasted
automatically into the string.

#### _Kernel and Object_

Everything is considered to be an object (integer, string ...). Each objects
are built in 'methods' ( <=> functions for Ruby). We call the method of an 
object as following:
* object_instance.method_name
Some methods are, as **puts** and **gets**, can be call everywhere and don't
need an object to be associate with.
  
Those methods are provided by the Kernel module and are included in all objects
by the class **Object** (and all objects come from **Object**).
When you run an application, an object called **main** of class **Object** is
automatically created and this provides access to the Kernel methods.
  
```
Kernel.exit => terminates process
```

#### _List method_

We can list all the method of a class or object:
* object.methods
* object.instance_methods
* object.instance_methods(false) => Hide the class's ancestors methods

#### _LocalJumpError_

Raised when Ruby can't yield as requested.

#### _Match operator_

There are 2 methods to check regex:
* match : return an instance of the class MatchData or nil.
* =\~ : return the starting position or nil.




#### _Method_

*See 'Parentheses' part*
In the example:
* x = '200.0'.to_f
The dot means that the message 'to_f' is being sent to the string '200.0'.
The string '200.0' is called the receiver of the message. Thus, when you see
a dot in this context, you should interpret it as a message (on the right) being
sent to an object (on the left).
* Object.message

* A method returns the value of the last line
* Method that act as queries are often named with a trailing ?
* Method that are 'dangerous', or modify the receiver, might be named with a trailing !
```
def my_name_is name <=> def my_name_is(name)

def my_name_is(name = nil) => The parameter 'name' is optional

def my_name_is(name = 'Jack') => The default parameter 'name' is 'Jack' and is optional
```

Note: We can't specify a value for the second parameter and use the default
value of the first parameter.
```
def my_name_is(name1 = 'Jack', name2 = 'John')
  'my name is ' + name1 + ' ' + name2
end

my_name_is 					# my name is Jack John
my_name_is 'Dave', 'Sterio' # my name is Dave Sterio
my_name_is name2='Dave' 	# my name is Dave John
```

#### _Modulo_

The sign of the result is always the same sign of the second operand
```
5 % 3   #  2
-5 % 3  #  1
5 % -3  # -1
-5 % -3 # -2
```
#### _Mutable_

*See 'Strings' part*
Can expand as needed, without using much time and memory.

#### _Nil_
nil is an object. nil and false evaluate to false. Everything else (including 
true and 0) means true.

#### _Numbers_

Underscore characters is ignored in the digit string (though not at the
beginning or end). 1_000_000 <=> 1000000
Integers are objects of class **Fixnum** or **Bignum**. **Fixnum** and
**Bignum** represent integers of differing sizes. Both classes descend from
the class **Integer**.
Floats are objects of class **Float**.
**Complex**, **BigDecimal** and **Rational** classes are not built-in to Ruby
but are distributed with Ruby as part of the standard library.

![Class hierarchy](http://rubylearning.com/images/class.png "Class hierachy")

#### _Object_

In Ruby, everything you manipulate is an object, and the results of those manipulations are
themselves objects. There are no primitives or data-types.

#### _Object serialization_

Ruby lets you store objects somewhere and reconstitute them when needed. Ruby
calls this kind of serialization marshaling. Saving an object and some or all
of its components is done using the method *Marshal.dump*. Later on you can 
reconstitute the object using *Marshal.load*. Ruby uses marshaling to store
session data.

#### _Operators and precedence_

![Operators and precedence](http://rubylearning.com/images/operators.jpg "Operators and precedence")
* ++ and -- are not available ('all' pre and 'post' forms)
* Brackets work the same way as with regular arithmetic

#### _Operator Or ||_

The only difference between 'Or' and '||' is their precedence. '||' has a higher
precedence than 'Or'.
A common idiom is to use '||' to assign a value to a variable only if that
variable is not already set.

```
@variable = @variable || "default value" <=> @variable ||= "default value"
```

#### _Parallel assignement_

*See 'Variables and assignement'*
```
x, y = y, x
```
This code will interchange the values of x and y. Values are separated from
each other with commas.

#### _Parameters_

*See 'Method' part*
Method can accept variable number of parameters using the splat argument.
The splat argument assign all parameters into an array. If no parameters are
set, the variable return an empty array.
```
def foo(*my_string)
  my_string.inspect
end

puts foo('hello','world')
puts foo()
```
On to the stack, the parameters are set from the left to right.
```
def foo(a = 99, b = a + 1)
  [a,b]
end

puts foo # [99, 100]
```
Parameters are passed by reference.

#### _Parentheses_

Optional with a method call, these calls are all valid:
```
foobar <=> foobar()
foobar(a, b) <=> foobar a, b
```

#### _Puts_

*See 'Kernel and Object' part*
If puts is passed an object that is not a string, puts calls the to_s method
of that object and prints the string returned by that method.

#### _Question mark_

The question mark has no special meaning in Ruby. Usually, this kind of method
return a value that answers the question posed by the method invocation
(example: empty?). Mostly it returns boolean, but this is not required.

#### _Rand_

The method rand get a random float greater than or equal to 0.0 and less than
1.0.

If you get an integer : rand(5) you will get a random integer greater than or
equal to 0 and less than 5.

#### _Range_

Express a sequence. Sequence are created using '..' and '...' range operators.
'..' inclusive range.
'...' excludes the specified high value.
Ranges are not represented internally as lists: the sequence 1..10000 is held
as a Range object containing references to two Fixnum objects.

#### _Regex_

// is a regular expression and an instance of the Regexp class.
Special characters are: ^, $, ?, ., /, \, [, ], {, }, (, ), +, *

* . (wildcard character) : Match any character except newline.
```
/.ejected/ # Match 'dejected', 'rejected', '%ejected', '8ejected', ...
```

* \[] (character class) : Explicit list of characters.
```
/[dr]ejected/  # Match only 'dejected' or 'rejected'
/[a-z]ejected/ # Match from 'aejected' to 'zejected' (all letters from a to z)
```

* ^ (caret) : Negative search of character class.
```
/[^dr]ejected/  # Match everything but 'dejected' or 'rejected'
/[^a-z]ejected/ # Match everything but 'aejected' to 'zejected' (all letters from a to z)
```

List of special escape sequences:
* \d <=> [0-9] : To match any digit
* \w : To match any digit, alphabetical character, or underscore
* \s : To match any whitespace
* \D : Negative \d
* \W : Negative \w
* \S : Negative \s

MatchData object returned by a successful match has a boolean value true or false,
which makes it handly for simple/no-match tests.


#### _Scope_

*See 'Variables and assignement'*
* Global Scope: Covers the entire program.
* Local Scope: Covers a module, class or method.

#### _self_

You can always see what object you are in (current object) by using the special
variables 'self'.

#### _Strings_

*See 'System method' part*
*See 'Symbols' part*
String are mutable. They can expand as needed, without using much time and 
memory. Ruby stores a string as a sequence of chars.
A special kind of string exists thats uses the back-tick (\`).
```
puts `ls` # Will call the command **ls**
```
There exists many methods to compare 2 strings:
```
s1 == s2
s1.eql?(s2)
s1.equal?(s2)
```

#### _Symbol_

*See 'Strings' part*
You don't have to pre-declare a symbol and they are guaranteed to be unique. No
matter where it appears in your program, a particular symbol will have the same
value.

You can consider the colon to mean: 'thing named' so, ':id' means 'the thing 
named id'.

A symbol is the most basic Ruby object you can create. It's just a name and 
an internal ID. Symbols are useful because a given symbol name refers to the
same object throughout a Ruby program. Symbols are more efficient thant strings.
Two strings with the same contents are two different objects, but for any given
name there is only one Symbol object. This can save both time and memory.

```
p "string".object_id # 21066960
p "string".object_id # 21066930
p :symbol.object_id  # 132178
p :symbol.object_id  # 132178
```

String Vs Symbol :
* if the content of the object is important  => Use a string
* if the identity of the object is important => Use a symbol

Ruby uses symbols and maintains a Symbol Table to hold them. Symbols are names,
names of instance variables, names of methods, names of classes. So, if there
is a method called control_movie, there is automatically a symbol
:control_movie.

If 'Fred' is a constant in one context, a method in another, an a class in a
third, the symbol :Fred will be the same object in all three contexts.

```
p "string".object_id # 21066960
p "string".object_id # 21066930
p :symbol.object_id  # 132178
p :symbol.object_id  # 132178
```

Test on symbol:

```
my_var = 'my_str'.object_id
if my_var == 'my_str'.object_id
  puts 'the same object'
else
  puts 'not the same object' # => This will be return
end

my_var = :my_sym.object_id
if my_var == :my_sym.object_id
  puts 'the same object' # => This will be return
else
  puts 'not the same object'
end
```

Change symbol to string and vice-versa:

```
'string'.to_sym.class # Symbol
'string'.to_s.class # String
```

#### _System method_

*See 'Strings' part*
This method executes the given command in sub-process. It returns true if the
command was found and executed properly. It return false if command exited with
a nonzero exit status, and nil if the command failed to execute.
* system('ls') <=> puts `ls`
* puts system('ls') will print the result of **ls** command then print true

#### _Type_

Basic types in Ruby:
* Numeric :
    * Fixnum
    * Integer
    * Float
* String
* Array
* Hash
* Object
* Symbol
* Range
* RegExp

#### _Variables and assignement_

*See 'Scope'*
Local variables and *barewords* must start with either underscore or lowercase 
letter, and they must consist entirely with of letters, numbers and underscores.
Whenever Ruby see a *barewords* it interprets it as one of three things:
1. If there's an equal sign (=) to the right of the *bareword* => it's a local
variable undergoing an assignement
2. If the *bareword* is in the list of keywords
3. If it is not 1. and 2., the *bareword* is assumed to be a method call. If no
method by that name exists, Ruby raise a **NameError**.

Global variable => Global Scope (covers the entire program).
foo   => Local variable    (Scope: on the method)
@foo  => Instance variable (Scope: on the instance, exist only 1 copy for an instance, it is share on all methods of the instance)
@@foo => Class variable    (Scope: on the class, exist only 1 copy for a class, it is share on all object of a class)
$foo  => Global variable   (Scope: on the program)
Ruby interpreter starts up with global variables already initialized:
* $0 => Contains the name of the file ruby is executing
* $: => Contains the directories that make up the path Ruby searches when you load an external file
* $$ => Contains the process id of the ruby process

#### _Yield_

*See 'Blocks'*
Yield is the keyword used to call the block in a method.