#!/usr/bin/env python
#-*- coding: utf-8 -*-
"""levenshtein module

.. module :: levenshtein
    :synopsis: levenshtein methods for distance calculations

.. topic:: summary

    :synopsis: levenshtein methods for distance calculations

    :Code: mature
    :Documentation: mature
    :test: 100%
    :Author: Thomas Cokelaer <Thomas.Cokelaer@sophia.inria.fr>
    :Revision: $Id$
    :Usage:
        >>> from openalea.plantik.tools.levenshtein import *

.. testsetup::

    from openalea.plantik.tools.levenshtein import *

"""
import numpy



def LevenshteinDistance(s1, s2):
    """Calculate the Levenshtein distance between sequences.
    
    The Levenshtein distance between two strings is defined as the minimum
    number of edits needed to transform one string into the other, with the
    allowable edit operations being insertion, deletion, or substitution
    of a single character. 

    .. doctest::

        >>> from openalea.plantik.tools.levenshtein import *
        >>> LevenshteinDistance('ba', 'abc')
        2.0
        >>> LevenshteinDistance('fee', 'deed')
        2.0

    """
    if type(s1)==str and type(s2)==str:
        s1 = [x for x in s1]
        s2 = [x for x in s2]
    m = len(s1)
    n = len(s2)
    #// d is a table with m+1 rows and n+1 columns
    d = numpy.zeros((m+1, n+1))

    #// d is a tqable with m+1 rows and n+1 columns

    for i in range(0,m+1):
        d[i, 0] = i # deletion
    for j in range(0,n+1):
        d[0, j] = j # insertion

    for j in range(0,n):
        for i in range(0,m):
            if s1[i] == s2[j]:
                d[i+1, j+1] = d[i, j]
            else:
                d[i+1, j+1] = min ( d[i, j+1] + 1,    d[i+1, j] + 1,  d[i, j] + 1)

    #print d
    return d[m,n]

def DamerauLevenshtein(seq1, seq2):
    """Calculate the Damerau-Levenshtein distance between sequences.

    This distance is the number of additions, deletions, substitutions,
    and transpositions needed to transform the first sequence into the
    second. Although generally used with strings, any sequences of
    comparable objects will work.
    
    In information theory and computer science, the Damerau-Levenshtein distance
    is a "distance" (string metric) between two strings given by counting the
    minimum number of operations needed to transform one string into the other,
    where an operation is defined as an insertion, deletion, or substitution
    of a single character, or a transposition of two characters. 
    In his seminal paper[1], Damerau not only distinguished these four edit 
    operations but also stated that they correspond to more than 80% of all 
    human misspellings. Damerau's paper considered only misspellings that could
    be corrected with at most one edit operation. Edit distance was introduced 
    by Levenshtein, who generalized this concept with multiple edit operations,
    but did not include transpositions in the set of basic operations.
    
    The name Damerau-Levenshtein distance is used to refer to an edit distance
    that allows multiple edit operations including transpositions.
    

    Transpositions are exchanges of *consecutive* characters; all other
    operations are self-explanatory.

    This implementation is O(N*M) time and O(M) space, for N and M the
    lengths of the two sequences.

    >>> from openalea.plantik.tools.levenshtein import *
    >>> DamerauLevenshtein('ba', 'abc')
    2
    >>> DamerauLevenshtein('fee', 'deed')
    2

    It works with arbitrary sequences too:

    >>> DamerauLevenshtein('abcd', ['b', 'a', 'c', 'd', 'e'])
    2
    """
    # codesnippet:D0DE4716-B6E6-4161-9219-2903BF8F547F
    # Conceptually, this is based on a len(seq1) + 1 * len(seq2) + 1 matrix.
    # However, only the current and two previous rows are needed at once,
    # so we only store those.
    oneago = None
    thisrow = range(1, len(seq2) + 1) + [0]
    for x in xrange(len(seq1)):
        # Python lists wrap around for negative indices, so put the
        # leftmost column at the *end* of the list. This matches with
        # the zero-indexed strings and saves extra calculation.
        twoago, oneago, thisrow = oneago, thisrow, [0] * len(seq2) + [x + 1]
        for y in xrange(len(seq2)):
            delcost = oneago[y] + 1
            addcost = thisrow[y - 1] + 1
            subcost = oneago[y - 1] + (seq1[x] != seq2[y])
            thisrow[y] = min(delcost, addcost, subcost)
            # This block deals with transpositions
            if (x > 0 and y > 0 and seq1[x] == seq2[y - 1]
                and seq1[x-1] == seq2[y] and seq1[x] != seq2[y]):
                thisrow[y] = min(thisrow[y], twoago[y - 2] + 1)
    return thisrow[len(seq2) - 1]
