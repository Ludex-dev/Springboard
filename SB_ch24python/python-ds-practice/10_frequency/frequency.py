def frequency(lst, search_term):
    """Return frequency of term in lst.
    
        >>> frequency([1, 4, 3, 4, 4], 4)
        3
        
        >>> frequency([1, 4, 3], 7)
        0
    """

    incre = 0
    for signature in lst:
        if signature is search_term:
            incre += 1
    return incre
    
print(frequency([1,4,3,4,4], 4))
print(frequency([1,4,3], 7))