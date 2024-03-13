def intersection(l1, l2):
    """Return intersection of two lists as a new list::
    
        >>> intersection([1, 2, 3], [2, 3, 4])
        [2, 3]
        
        >>> intersection([1, 2, 3], [1, 2, 3, 4])
        [1, 2, 3]
        
        >>> intersection([1, 2, 3], [3, 4])
        [3]
        
        >>> intersection([1, 2, 3], [4, 5, 6])
        []
    """
    intersectionList = []
    for lstA in l1:
        for lstB in l2:
            if lstA == lstB:
                intersectionList.append(lstA)
    return intersectionList

print(intersection([1, 2, 3], [2, 3, 4]))
print(intersection([1, 2, 3], [2, 3, 4]))
print(intersection([1, 2, 3], [1, 2, 3, 4]))
print(intersection([1, 2, 3], [3, 4]))
print(intersection([1, 2, 3], [4, 5, 6]))