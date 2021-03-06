# Experimental file to accept waypoints from simulation, 
# and plan from model, and create a dict linking the pddl name (w1x, w2y, w2x...)
# and the actual values of the coordinates
# Note: ROS is needed for this to run. 

# Author: Emma Karlsmose
# Last Edited: 10 May 2022

# Parsed path file is saved to inspection_plan/waypoints directory

# import rospy
import rospkg
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

class ParseNavigation():
    def __init__(self):

        #Specify names of plan file and file with the waypoints that was copied to pddl
        # self.planName = "/pddl/plans/plan16-01-03-test"
        # self.pddlWaypoints = "/src/outputs/waypoint-lookup" + ".txt"
        # self.outputFile = "/src/outputs/parsed-plans/plan16-01-03_waypoints"
        self.planName = "/pddl/plans/" + input("Provide file name of input plan file (incl extension if it has one): ")
        self.pddlWaypoints = "/src/outputs/" + input("Provide name of waypoint lookup file (excl extension): ") + ".txt"
        self.outputFile = "/src/outputs/parsed-plans/" + input("What would you like to name your parsed plan (excl extension): ")

        #Get path to project
        self.rospack = rospkg.RosPack()
        self.projectPath = self.rospack.get_path('inspection_plan')

        self.planFile = self.getFile(self.planName, 'r')
        self.waypointFile = self.getFile(self.pddlWaypoints, 'r')

        #Parse plan
        simplePlan = self.getPlanList(self.planFile)
        wpDict = self.getWpNames(self.waypointFile)
        planList = self.replaceNames(simplePlan, wpDict)
        planDict = self.createPlanDict(planList)
        self.createCSV(planDict)

        #Option to save file:
        decision = input("Would you like to save a path plot? (y/n)\n")
        if decision.lower() == "y":
            self.printPath(planDict)
            print(decision.lower())
        else:
            print("no plot created")

    #Turn data in waypoint lookup file into a dictionary
    def getWpNames(self, lookupFile):
        return dict(x.strip().split('=') for x in lookupFile)

    #cleans plan from whitespace and splits information in a step into individual elements
    def getPlanList(self, rawPlan):
        newPlan = []
        finalPlan = []
        # actions = ['move', 'inspect', 'register-radiation']
        
        # Remove uneccesary characters from plan
        for step in rawPlan:
            # for x in actions:
            #     step = step.replace(x, '')
            step = step.lower()
            newPlan.append(step.strip('\n()  '))
        
        # remove current waypoints from plan
        for step in newPlan:
            step = step.split(" ")
            finalPlan.append(step)
        #print(finalPlan)
        return(finalPlan)

    #import textfile and parse into list
    def getFile(self, fileName, mode):
        #Open files 
        file = open(self.projectPath + fileName, mode)

        #Create list from lines
        lineList = file.readlines()

        return lineList

    #Function to look up waypoint names (w1x, w2x, w1y...) and get their coordinate values
    def replaceNames(self, plan, wpDict):
        newPlan = []
        # print(wpDict)
        for step in plan:
            print(step)
            newPlan.append([float(wpDict.get(wp)) if wp[0] == 'w' and (len(wp)==3 or len(wp)==4) else wp for wp in step])
            # newPlan.append([wp[1:-1] for wp in step if wp[0]=='w'][0])
        print("replaceNames>> {}".format(newPlan))
        return newPlan
    
    #Function to add step number to plan, and create dictionary for waypoints
    def createPlanDict(self, plan):
        #Transform to dictionary
        index = [i+1 for i, e in enumerate(plan)]
        tasks = [step[0] for step in plan]
        values = [step[1:] for step in plan]
        indexed = list(zip(index, tasks))

        #Create a lookup dictionary for step. NOT USED, left for backup       
        stepDict = {}
        for key in indexed:
            # print(key)
            if 'move' in key: #removes initial coordinates if step involves moving
                stepDict[key] = values[key[0]-1][2:]
            elif 'inspect' in key:
                stepDict[key] = [values[key[0]-1][:-1], values[key[0]-1][-1]]
            else:
                stepDict[key] = values[key[0]-1]
        
        #Create formatted list with steps. Can later try to edit so that instead of just
        # waypoint, it gives the name of the waypoint (its number)
        stepList = []
        for key in indexed:
            if 'move' in key:
                stepList.append([key[0], key[1], values[key[0]-1][2:], 'waypoint'])
            # elif 'inspect' in key:
            #     stepList.append([key[0], key[1], values[key[0]-1][:-1], values[key[0]-1][-1]])
            elif 'register-radiation' in key:
                stepList.append([key[0], key[1], values[key[0]-1], 'radiation'])
            elif 'switch-on' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-1]])
            elif 'switch-off' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-1]])
            elif 'inspect-toggle-vessel' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-1]])
            elif 'inspect-wall' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-1]])
            elif 'inspect-vessel' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-1]])
            elif 'read-pressure' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-1]])  
            elif 'open-valve' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-2]])
            elif 'close-valve' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-2]])
            elif 'inspect-pipes' in key:
                stepList.append([key[0], key[1], values[key[0]-1][0:2], values[key[0]-1][-2]])
            else:
                print("createPlanDict> SOMETHING UNEXPECTED HAPPENED")
        print(*stepList, sep='\n')
        return stepList

    #Save parsed navigation plan to CSV 
    def createCSV(self, plan):
        df = pd.DataFrame(plan)
        df.to_csv(self.projectPath + self.outputFile + ".csv", index = False, header = False)

    #Function to create a path plot
    def printPath(self, plan):
        path = [x[2] for x in plan] #if x[1]=='move']
        print(path)
        df = pd.DataFrame(path)
        print(df)

        u = np.diff(df[0])
        v = np.diff(df[1])

        startx = df.loc[0][0]
        starty = df.loc[0][1]

        plotName = input("What would you like to name your figure?\n")
        plt.figure(figsize=(9,9))
        plt.title("Robot Path")
        plt.scatter(startx, starty, c='green', zorder=3)
        plt.plot(df[0], df[1], '.', color='orange', zorder=2)
        plt.quiver(df[0][:-1], df[1][:-1], u, v, scale_units='xy', angles='xy', scale=1, width=0.002, headwidth=9, headlength=10, zorder=1)
        plt.ylim(ymax=10, ymin=-10)
        plt.xlim(xmax=10, xmin=-10)
        plt.xticks(range(-9,10,3))
        plt.yticks(range(-9,10,3))
        plt.xlabel("x")
        plt.ylabel("y")
        plt.savefig(self.projectPath + "/src/figures/" + plotName + ".png")
        plt.show()


        

if __name__ == '__main__':
    test = ParseNavigation()
#     plan = test.getPlanList(test.planFile)
#     print(*plan, sep = "\n")
#     wpDict = test.getNames(test.waypointFile)
#     plan = test.replaceNames(plan, wpDict)
#     print(*plan, sep = "\n")
#     test.createCSV(plan)
#     test.printPath(plan)