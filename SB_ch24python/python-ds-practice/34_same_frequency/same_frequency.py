def same_frequency(num1, num2):
    """Do these nums have same frequencies of digits?
    
        >>> same_frequency(551122, 221515)
        True
        
        >>> same_frequency(321142, 3212215)
        False
        
        >>> same_frequency(1212, 2211)
        True
    """
    dict={}
    dict2={}
    for num in str(num1):
        if num1 in dict:
            dict[num] += 1
        else:
            dict[num] = 1
    
    for num in str(num2):
        if num2 in dict2:
            dict2[num] += 1
        else:
            dict2[num] = 1

    return dict == dict2
    
print(same_frequency(551122, 221515))
print(same_frequency(321142, 3212215))
print(same_frequency(1212, 2211))