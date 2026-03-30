import bagpy
from bagpy import bagreader
import pandas as pd
import seaborn as sea
import matplotlib.pyplot as plt
import numpy as np
b = bagreader('SD_3398_waypoint_navigation.bag')
csvfiles = []
for t in b.topics:
    data = b.message_by_topic(t)
    csvfiles.append(data)

print(csvfiles[0])
data = pd.read_csv(csvfiles[0])
