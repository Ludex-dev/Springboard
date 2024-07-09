def reverse_string(phrase):
    """Reverse string,

        >>> reverse_string('awesome')
        'emosewa'

        >>> reverse_string('sauce')
        'ecuas'
    """
    decre = 0
    reversePhrase = ''
    while decre < len(phrase):
        decre += 1
        iterable = len(phrase)-decre
        reversePhrase += phrase[iterable]
        if iterable == 0:
            # return 'End of Iteration for: {phrase}'
            return reversePhrase
    
print(reverse_string('awesome')) 
print(reverse_string('sauce'))