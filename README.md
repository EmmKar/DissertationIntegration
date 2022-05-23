# Integration Package for PDDL Model into ROS-Gazebo simulation


See users and maintenance manuals in report appendixes for instructions on how to run code. 

## FILES OF IMPORTANCE
- **scripts**/inspection_plan: ROS node containing code to parse the plan to the simulation
- **scripts**/generate_waypoints: ROS node to generate waypoints
- CMakeLists.txt and package.xml: These file are used when catkin builds the package. Minor edits have been made, the code there is specific to the needs of this project, but it was essentially just uncommenting code already generated when the package was created. 
- README.md
- **src**
    - format-metricff.py used to format the terminal output of metric-ff planner to something that VAL will accept. 
    - parse-plan.py used to parse a plan into something inspection_plan can use
    - parse-waypoints-to-pddl.py helper file to format waypoints into pddl code, as doing so can be tedious work otherwise. NOTE: doesn't generate the complete code, you will have to edit the problem file yourself as well. 
    - **figures**
        - path plots and scatter plots of waypoints. plan32-01-PARSED is the path plot of the solution for domain3-2, problem32-01-objects 
    - **outputs**
        - director to store outputs of python scripts, including lookup files (which connect PDDL waypoint names with their coordiantes) and waypoints-to-pddl code files, both from using parse-waypoints-to-pddl.py
        - **parsed-plans**
            - stores the plans that can be read by the inspection_plan node. Currently contains plan32-01, which solves domain-3-2, problem32-01-objects
- **waypoints**
    - stores raw waypoint files, as they are created when running the generate_waypoints node. 
- **model-files**:
    - domain-3-1.pddl and domain-3-2.pddl. Current domain files. At the moment they are essentially the same, domain-3-2 was created to attempt to solve some of the many issues I've had with scalability and cost-optimisation, but was gradually changed back into something that works such that i have some functioning code. 
    - domain31-timetest* problem files used to test the complexity endurance of planners for the evaluation section in the report. They pair with domain-3-1
    - domain31-prob* various problem files that go with domain-3-1. These may be buggy
    - domain32-prob* problem files to go with domain-3-2. These should work, at least they did for me. The output files from running domain32-prob01-objects are available in the package.
    - there are more files used in the development of the model in DEV-BACKUPS, but they are very old versions. I started using github for versioning rather than extensive backupping. 
    - **plans**: plans found (and not found) when running domain-problem combinations through planners. The first number in their name indicate the domain, the second the problem version, and it is indicated which planner was used. Timetest files provide the data used for the table in the report.
- **reports**:
    - stores radiation reports outputted from successful plan executions (and now also failed). The file contained within is the report from planning problem 32-01-objects, where all objects were inspected, and radiation measured underway. 
    - 

ANY DIRECTORY CALLED **DEV-BACKUPS** or **misc** contain files I've used during development, but which are outdated in terms of the final result. No need to examine these. 
