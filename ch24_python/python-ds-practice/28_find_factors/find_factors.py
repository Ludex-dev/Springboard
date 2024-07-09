
def find_factors(num):
    """Find factors of num, in increasing order.

    >>> find_factors(10)
    [1, 2, 5, 10]

    >>> find_factors(11)
    [1, 11]

    >>> find_factors(111)
    [1, 3, 37, 111]

    >>> find_factors(321421)
    [1, 293, 1097, 321421]
    """
    list = []
    for nums1 in range(1, num + 1):
      for nums2 in range(1, num + 1):
         if nums1 == nums2 and nums1 * nums2 == num:
               if nums1 not in list:
                list.append(nums1)
         elif nums1 * nums2 == num:
                if nums1 not in list:
                    list.append(nums1)
                if nums2 not in list:
                    list.append(nums2)
    return sorted(list)

print(find_factors(10))
print(find_factors(11))
print(find_factors(111))
# print(find_factors(321421))