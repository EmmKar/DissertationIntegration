;Model version 1.5. Classical planning, incl movement and abstract inspection.

(define (domain inspection015)

    (:requirements :strips :typing :negative-preconditions)

    (:types
        waypoint interesting - object
    )

    (:predicates
        (at-waypoint ?x - waypoint)             ;true iff x is a waypoint and the robot is located at x
        (has-passed ?x - waypoint)              ;true iff x is a waypoint nad the robot has previously passed x
        (rob-facing ?o - object)         ;true iff x is a waypoint and the robot is facing x
        (has-inspected ?i - interesting)      ;true iff o is an interesting nuclear reactor object and the robot has inspected object
        (by-interesting ?x - waypoint ?o - interesting)  ;true iff o is an interesting nuclear reactor object, x is a waypoint, and x is located at o
    )
    
    ;action to turn towards waypoint
    (:action turn
        ;we have a waypoint x and some elements e and f that is either an object or a waypoint .
        :parameters (?w - waypoint ?e - object ?f - object) 
        
        ;the robot is at waypoint x and there is a waypoint or an interesting object
        :precondition (and  (at-waypoint ?w) 
                            (rob-facing ?f) 
                            (not (rob-facing ?e))) 
        
        ;the effect is that the robot is facing the object e and no longer the object f
        :effect (and    (at-waypoint ?w) 
                        (rob-facing ?e) 
                        (not (rob-facing ?f)))
        
        ;NEED ATTENTION: HOW DO I MAKE THE ROBOT STOP FACING EVERYTHING ELSE???
    
    )
    
    ;action to move to a certain waypoint
    (:action move
        ;we have two waypoints: x and y.
        :parameters (?from - waypoint ?to - waypoint)
        
        ;the robot is at waypoint x and is facing waypoint waypoint y
        :precondition (and  (at-waypoint ?from) 
                            (rob-facing ?to))
        
        ;effect of move is that robot will be at waypoint waypoint y 
        :effect (and    (at-waypoint ?to) 
                        (not (at-waypoint ?from)) 
                        (has-passed ?to) 
                        (has-passed ?from)) ; figure out a better way to do this, each waypoint except the first will be considered passed twice.
    )
    
    ;action to inspect an object
    (:action inspect
        ;we have a waypoint x and an object o
        :parameters (?w - waypoint ?i - interesting)
        
        ;robot is at waypoint x, waypoint x is at the interesting object o, and robot is facing o
        :precondition (and  (at-waypoint ?w) 
                            (by-interesting ?w ?i) 
                            (rob-facing ?i)) 
        
        ;the element goes to having been inspected
        :effect (and (has-inspected ?i))
    )
    
    ;action to sense radiation
    
    
    
)
