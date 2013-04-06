#This is the developers guidelines for box_model i3. 
its focuses on two main areas, how to share your ideas and how to publish your changes.

##If you are not going to do programming
but you have idea on how to make the printer better, draw it on paper. Use pencils of different color for different materials and possibly parts. Scan or photograph it, publish it on iternet and let me know at [gmail] (mailto:axtheb+prusa3@gmail.com). We will discuss it on irc, and if somenone likes the idea it may be implemented.

##If you are going to write some code
fork the repo on github, write code, send pull request. Its always good to come to IRC channel #prusa3-dev on freenode to discuss the changes.

###Style guide
Use one true brace style, ie. open the block on same line as the module statement:
```
module my_awesome code(awesome_parameter=1){
    something();
}
```
Note there are no spaces around the = in the definition of implicit parameters, its not there even on module calls. Put spaces after commas, around mathematical operators but not unary minus.
```
cube([10, (a / 2) + 1, -1]);
```
Indent by four spaces, dont leave spaces at end of line.

*If you dont do this, yor code will be reformated and it makes checking author of code harder*
