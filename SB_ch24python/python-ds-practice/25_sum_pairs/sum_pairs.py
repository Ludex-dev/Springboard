def sum_pairs(nums, goal):
    """Return tuple of first pair of nums that sum to goal.

    For example:

        >>> sum_pairs([1, 2, 2, 10], 4)
        (2, 2)

    (4, 2) sum to 6, and come before (5, 1):

        >>> sum_pairs([4, 2, 10, 5, 1], 6) # (4, 2)
        (4, 2)

    (4, 3) sum to 7, and finish before (5, 2):

        >>> sum_pairs([5, 1, 4, 8, 3, 2], 7)
        (4, 3)

    No pairs sum to 100, so return empty tuple:

        >>> sum_pairs([11, 20, 4, 2, 1, 5], 100)
        ()
    """

    # for num in nums:
    #     if goal - num in nums:
    #         return (num, goal - num)

    # return ()

    # for num in nums:
    #     for num2 in nums:
    #         if (num + num2) == goal:
    #             goal_Reached = (num, num2)
    #         else:
    #             continue
    
    # for iterable in nums:
    #     for iterable_index in range(len(nums)):
    #         print(f'{iterable}, {nums[iterable_index + 1]}')
    #         if iterable + nums[iterable_index + 1] == goal:
    #                 return (f'{iterable}, {nums[iterable_index + 1]}')

    # for iterable_index, iterable_value in enumerate(nums):
    #     step_ahead = iterable_index + 1
    #     # if step_ahead > len(nums):
    #     #     continue
    #     #     print(step_ahead)
    #     # else:
    #     #     step_ahead = iterable_index
    #     # step_ahead = iterable_index + 1
    #     # print (f'{nums[step_ahead]} + {iterable_value} {nums[step_ahead] + iterable_value}')
    #     print(f'{iterable_value}, {nums[step_ahead]}')
        
    #     if iterable_value + nums[step_ahead] == goal:
    #         return (f'{iterable_value}, {nums[step_ahead]}') 
    #         # return "Goal Reached"

    # # return (goal_Reached)
    
    qualified_pairs = set()

    for iterable in nums:
        qualification = goal - iterable

        if qualification in qualified_pairs:
            return (qualification, iterable)
        
        qualified_pairs.add(iterable)
    return()

print(sum_pairs([1, 2, 2, 10], 4))
print(sum_pairs([4, 2, 10, 5, 1], 6))
print(sum_pairs([5, 1, 4, 8, 3, 2], 7))
print(sum_pairs([11, 20, 4, 2, 1, 5], 100))