#! /usr/bin/env python 3

import numpy as np
import pandas as pd # data analysis package
import matplotlib.pyplot as plt

# filepath of csv data
FILEPATH = '/Users/gerald/Documents/TA-ing/MCHE 474/Me'
FILE_NAME = 'MCHE474-001-202240 Grades.csv'

df = pd.read_csv(f'{FILEPATH}/{FILE_NAME}', index_col='Last name')

hist_array = df['Test 2 (Real)'].to_numpy()

# clip the outliers to be within the bin ranges
hist_array = np.clip(hist_array, 0, 100)

# define bin ranges
bin_ranges = np.arange(0,101,10)

#############################################################
fig = plt.figure(figsize=(6,4))
ax = plt.gca()
plt.subplots_adjust(bottom=0.17, left=0.17, top=0.96, right=0.96)

# Change the axis units font
plt.setp(ax.get_ymajorticklabels(),fontsize=18)
plt.setp(ax.get_xmajorticklabels(),fontsize=18)

ax.spines['right'].set_color('none')
ax.spines['top'].set_color('none')

ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')

# Turn on the plot grid and set appropriate linestyle and color
ax.grid(True,linestyle=':', color='0.75')
ax.set_axisbelow(True)

# Define the X and Y axis labels
plt.xlabel('Grade Range', fontsize=22, weight='bold', labelpad=5)
plt.ylabel('Occurences', fontsize=22, weight='bold', labelpad=10)

plt.hist(hist_array, bins=bin_ranges, range=(0,100), rwidth=0.75, align='left')
plt.xticks(np.arange(0,91,10),labels=[r'$<$10', r'10s', r'20s',r'30s',r'40s',r'50s',r'60s',r'70s',r'80s', r'$\geq$90']) # label the left edge of each bin
plt.yticks(np.arange(0,17,2))

# uncomment below and set limits if needed
plt.xlim(-5,95)
plt.ylim(0,16)

# Adjust the page layout filling the page using the new tight_layout command
plt.tight_layout(pad=0.5)

# save the figure as a high-res pdf in the current folder
# plt.savefig('plot_filename.pdf')

plt.show()