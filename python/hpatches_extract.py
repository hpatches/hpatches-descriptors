import sys
import glob
import os
import cv2
import numpy as np

assert len(sys.argv)==2, "Usage python hpatches_extract.py hpatches_db_root_folder"
    
# all types of patches 
tps = ['ref','e1','e2','e3','e4','e5','h1','h2','h3','h4','h5',\
       't1','t2','t3','t4','t5']

class hpatches_sequence:
    """Class for loading an HPatches sequence from a sequence folder"""
    itr = tps
    def __init__(self,base):
        name = base.split('/')
        self.name = name[-1]
        self.base = base
        for t in self.itr:
            im_path = os.path.join(base, t+'.png')
            im = cv2.imread(im_path,0)
            self.N = im.shape[0]/65
            setattr(self, t, np.split(im, self.N))
            
    
seqs = glob.glob(sys.argv[1]+'/*')
seqs = [os.path.abspath(p) for p in seqs]     

descr_name = 'misigma'

for seq_path in seqs:
    seq = hpatches_sequence(seq_path)
    path = os.path.join(descr_name,seq.name)
    if not os.path.exists(path):
        os.makedirs(path)
    descr = np.zeros((seq.N,2)) # trivial (mi,sigma) descriptor
    for tp in tps:
        print(seq.name+'/'+tp)
        for i,patch in enumerate(getattr(seq, tp)):
            mi = np.mean(patch)
            sigma = np.std(patch)
            descr[i] = np.array([mi,sigma])
        np.savetxt(os.path.join(path,tp+'.csv'), descr, delimiter=',')   # X is an array
