def multiple_letter_count(phrase):
    """Return dict of {ltr: frequency} from phrase.

        >>> multiple_letter_count('yay')
        {'y': 2, 'a': 1}

        >>> multiple_letter_count('Yay')
        {'Y': 1, 'a': 1, 'y': 1}
    """


    temp_dict = {}
    for char in phrase:
        if char in temp_dict:
            temp_dict[char] += 1
        else:
            temp_dict[char] = 1
    return temp_dict

print(multiple_letter_count('yay'))
print(multiple_letter_count('Yay'))


