def vowel_count(phrase):
    """Return frequency map of vowels, case-insensitive.

        >>> vowel_count('rithm school')
        {'i': 1, 'o': 2}
        
        >>> vowel_count('HOW ARE YOU? i am great!') 
        {'o': 2, 'a': 3, 'e': 2, 'u': 1, 'i': 1}
    """

    vowels = "aeiou"
    counted_Vowels = {}
    for letter in phrase: #check 1:1, where the iter in in lower() form
        if letter.lower() in vowels:
            vowel = letter.lower()
            if vowel in counted_Vowels:
                counted_Vowels[vowel] += 1
            else:
                counted_Vowels[vowel] = 1
    return counted_Vowels

print(vowel_count('rithm school'))
print(vowel_count('HOW ARE YOU? i am great!'))