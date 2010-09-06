

from openalea.plantik.tools.levenshtein import *


def test_damerau():

    assert DamerauLevenshtein('ba', 'abc') == 2
    assert DamerauLevenshtein('fee', 'deed') == 2
    assert DamerauLevenshtein('abcd', ['b', 'a', 'c', 'd', 'e']) == 2


def test_levenshtein():

    assert LevenshteinDistance('ba', 'abc') == 2



