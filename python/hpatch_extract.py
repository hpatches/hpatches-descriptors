import sys
sys.path.append("../../utils")
from hpatch import *
import glob
import os

itr = ['ref','e1','e2','e3','e4','e5','h1','h2','h3','h4','h5','t1','t2','t3','t4','t5']

seqs = glob.glob("../../hpatch-release/*")
seqs = [os.path.abspath(p) for p in seqs]     

descr_name = 'misigma'

for seq_path in seqs:
    seq = hpatch_sequence(seq_path)
    path = os.path.join(descr_name,seq.name)
    if not os.path.exists(path):
        os.makedirs(path)
    descr = np.zeros((seq.N,2)) # trivial (mi,sigma) descriptor
    for tp in itr:
        print(seq.name+'/'+tp)
        for i,patch in enumerate(getattr(seq, tp)):
            mi = np.mean(patch)
            sigma = np.std(patch)
            descr[i] = np.array([mi,sigma])
        np.savetxt(os.path.join(path,tp+'.csv'), descr, delimiter=',')   # X is an array
