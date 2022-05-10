# Experimental file to accept waypoints from simulation, 
# and plan from model, and create a dict linking the pddl name (w1x, w2y, w2x...)
# and the actual values of the coordinates
# Note: ROS is needed for this to run. 

# Author: Emma Karlsmose
# Last Edited: 10 May 2022

import rospkg
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np

class ParseNavigation():
    def __init__(self):

        #Specify names of plan file and file with the waypoints that was copied to pddl
        self.planName = "/pddl/plans/plan.txt"
        self.pddlWaypoints = "/src/waypoint-lookup.txt"
        self.outputFile = "/waypoints/plan_waypoints"

        #Get path to project
        self.rospack = rospkg.RosPack()
        self.projectPath = self.rospack.get_path('inspection_plan')

        self.planFile = self.getFile(self.planName, 'r')
        self.waypointFile = self.getFile(self.pddlWaypoints, 'r')

        simplePlan = self.getPlanList(self.planFile)
        wpDict = self.getNames(self.waypointFile)
        plan = self.replaceNames(simplePlan, wpDict)
        self.createCSV(plan)

        #Option to save file:
        decision = input("Would you like to save a path plot? (y/n)\n")
        if decision.lower() == "yes" or "ye" or "y":
            self.printPath(plan)
        else:
            print("No plot created")

    #Turn data in waypoint lookup file into a dictionary
    def getNames(self, lookupFile):
        return dict(x.strip().split('=') for x in lookupFile)

    #Returns a list consisting only of waypoint names per entry
    #First two coordinates are current waypoint, the latter two are the goal waypoint
    #Note, empty lines in plan file will result in errors
    def getPlanList(self, rawPlan):
        newPlan = []
        finalPlan = []
        actions = ['move', 'turn']
        
        # Remove uneccesary characters from plan
        for step in rawPlan:
            for x in actions:
                step = step.replace(x, '')
            newPlan.append(step.strip('\n()  '))
        
        # remove current waypoints from plan
        for step in newPlan:
            step = step.split(" ")
            finalPlan.append(step[2:])
        return(finalPlan)

    #import textfile and parse into list
    def getFile(self, fileName, mode):
        #Open files 
        file = open(self.projectPath + fileName, mode)

        #Create list from lines
        lineList = file.readlines()

        return lineList

    def replaceNames(self, plan, wpDict):
        newPlan = []
        for step in plan:
            newPlan.append([float(wpDict.get(wp)) for wp in step])
        return newPlan
        
    #Save parsed navigation plan to CSV 
    def createCSV(self, plan):
        df = pd.DataFrame(plan)
        df.to_csv(self.projectPath + self.outputFile + ".csv", index = False, header = False)

    def printPath(self, plan):
        df = pd.DataFrame(plan)

        u = np.diff(df[0])
        v = np.diff(df[1])

        startx = df.loc[0][0]
        starty = df.loc[0][1]

        plotName = input("What would you like to name your figure?\n")
        plt.figure()
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