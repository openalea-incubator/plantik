
The following files ,Seq07_T_C_f.txt and Seq07_T_C_b.txt contains sequences related to fuji (f) and braeburn (b) apple trees that are unpruned (Source Damien Fumey). The sequences can be extracted using:

    from openalea.sequence_analysis import *
    from openalea.plantik import get_shared_data
    s1 = Sequences(get_shared_data('Seq07_T_C_f.txt'))
    s2 = Sequences(get_shared_data('Seq07_T_C_b.txt'))


The first variable is the type of branch on the trunk
The second variable contains the number of internode per branch (on trunk as well)
The third variable contains the length of each branches (on trunk as well)

