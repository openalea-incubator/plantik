"""How to use it:

In lpy run the model, then in the shell type:

    from openalea.plantik.tools.distance import get_distance
    get_distance(lstring, 'fuji')[0][-1]

The last command returns the distance of the trunk sequence between the simulated plant and the 40 fuji sequences.

"""

from openalea.sequence_analysis import Sequences, SelectVariable, VectorDistance, Compare, Merge, ImprovedDistanceMatrix
#from vplants.plantik import get_shared_data


def get_data(cultivar='fuji'):
    from vplants.plantik import get_shared_data
    if cultivar=='fuji':
        return Sequences(get_shared_data('Seq07_T_C_f.txt'))
    elif cultivar=='braeburn':
        return Sequences(get_shared_data('Seq07_T_C_b.txt'))

def get_distance(lstring, cultivar='fuji'):
    """get lstring , extract sequence of the trunk, compare with a list of sequences"""
    seq2 = lstring[0][0].mtgtools.get_trunk_sequence()

    if len(seq2)<=2:
        compatible_seq = Sequences([[1],[2]])
    else:
        if len(set(seq2)) == 1:
            if seq2[1]<3:
                seq2[0] = seq2[1]+1
            else:
                seq2[0] = seq2[1]-1
        compatible_seq = Sequences([[b] for b in seq2])

    sequences = get_data(cultivar)
    distance_matrix = Compare(Merge(SelectVariable(sequences,1), compatible_seq),
                                                VectorDistance("O"), End="Free")

    idm = ImprovedDistanceMatrix(distance_matrix)
    res = idm.cumulated_distance()

    return res, idm
