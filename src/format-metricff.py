import rospkg


planName = input("Input plan file (must be in plans folder): ")

rospack = rospkg.RosPack()
projectPath = rospack.get_path('inspection_plan')

file = open(projectPath + "/pddl/plans/" + planName, 'r')
lineList = file.readlines()

output = open(projectPath + '/pddl/plans/' + planName + '-ValParsed', "w")

for step in lineList:
    step = step.lower()
    step = step.split(':')
    step = step[1].strip()
    output.write("(" + step + ")\n")

output.close()
file.close()
