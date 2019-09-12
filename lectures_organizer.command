#!/usr/bin/env python
# coding: utf-8

# In[2]:


import os


# In[3]:


mainPath = '/Users/fabiomagarelli/Documents/UCD_semester_3/'


# In[4]:


def printMenu(*args):
    if not args:
        print('#'*39)
        print('| WELCOME TO LECTURES ORGANIZER sem.3 | ')
    print('#'*39)
    print('# MAIN MENU:')
    print('# 1 - New Lecture notes')
    print('# 2 - Read Lecture')
    print('# 0 - Exit')
    print('#'*39)
    choice = int(input('Enter your choice: '))
    while choice not in [1,2,0]:
        choice = int(input('Enter your choice: '))
    if choice == 0:
        return
    else:
        print('#'*39)
        print('# 1 - COMP41690: Android')
        print('# 2 - COMP47570: Ubiquitous Comp.')
        print('# 3 - COMP47530: Ruby')
        print('# 4 - COMP47460: Machine Learning')
        print('# 5 - COMP47520: IoT')
        print('# 0 - Back to main menu')
        print('#'*39)
        choice2 = int(input('Enter your choice: '))
        modules_dict = {0:0,1:41690,2:47570,3:47530,4:47460,5:47520}
        while choice2 not in list(modules_dict.keys()):
            choice2 = int(input('Enter your choice: '))
        if choice2 == 0:
            printMenu()
        elif choice == 1:
            newLecture(modules_dict[choice2])
        elif choice == 2:
            readLecture(modules_dict[choice2])
        print()
        printMenu('notitle')
        


# In[5]:


def openfile(module_path):
    os.system('open -a Atom ~%s' % module_path[module_path.find('/Documents'):])


# In[9]:


def newLecture(module):
    module_names = {41690:'Android Programming',47570:'Ubiquitous Computing',47530:'Exploring Ruby',47460:'Machine Learning',47520:'Programming for IoT'}
    module_path = str(mainPath + 'Lectures_notes/COMP_%i' % module)
    lecture_n = 0
    if os.path.exists(module_path):
        # r=root, d=directories, f = files
#         try:
        for r, d, f in os.walk(module_path):
            lecture = tuple(f)[-1]
            lecture_n = int(lecture[lecture.find('_')+1:lecture.find('.')])
            break
#         except:
#             pass
    else:
        os.makedirs(module_path)
        
    lecture_n += 1
    file_path = '%s/lecture_%i.md' % (module_path,lecture_n)
    with open(file_path, 'w') as file:
        file.write('# Lecture %i \n' % lecture_n)
        file.write('#### COMP:%i - %s' % (module,module_names[module]))
    openfile(module_path)


# In[10]:


def readLecture(module):
    module_path = str(mainPath + 'Lectures_notes/COMP_%i' % module)
    print(module_path)
    print(os.path.exists(module_path))
    if os.path.exists(module_path):
        openfile(module_path)
    else:
        print('Sorry there are no lectures for this module yet.')


# In[11]:


printMenu()


# In[ ]:




