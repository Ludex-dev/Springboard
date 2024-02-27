def print_upper_words0(string):

    for word in string:
        print(word.upper())

# print_upper_words0(["Hello", "World", "Once", "Again"])

def print_upper_words1(string):
    """Print each word on sep line, uppercased, if starts with E or e.

        >>> print_upper_words2(["eagle", "Edward", "Alfred"])
        EAGLE
        EDWARD
    """

    for word in string:
        if word.startswith("E") or word.startswith("e"):
            print(word.upper())

# print_upper_words1(["Edward", "Elric", "eric", "Eustive", "Alfred", "zope"])

def print_upper_words2(string, starterltr):
    

    for word in string:
        for letters in starterltr:
            if word.startswith(letters):
                print(word.upper())
                

(print_upper_words2(["hello", "hey", "goodbye", "yo", "yes"], starterltr={"h", "y"}))