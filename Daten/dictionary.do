*** First define the dictionary in a macro
*** e.g. the words Hallo, hallo, World and world are in our dictionary
local dictionary Hallo hallo world World
*** generate a variable that is to be = 1 if one of the words defined in the dictionary appears in the string variables used
generate dictionary_occurence = 0
*** then use a loop: we replace dictionary_occurence with 1 if one of the words of the dictionary occurs in the string variable
foreach word in `dictionary' {
	replace dictionary_occurence = 1 if regexm(string, "`word'") == 1
}