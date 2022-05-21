; MODEL TO MOVE ROBOT FROM WAYPOINT W1 to WAYPOINT W3 inspecting objects on the way
; - turns to objects before inspecting 
;
;Predicates:
;   WAYPOINT(x) - true iff x is a waypoint
;   at-waypoint(x) - true iff x is a waypoint and the robot is at x
;   rob-facing(x) - true iff x is a waypoint and the robot is facing towards x
;
;Actions: 
;   turn to face waypoints
;   move between waypoints
;
;Assumes robot comes to 0 velocity after each movement 
; 
;TO DO:
; - Add types
; - Add action to sense radiation
; - Add action to inspect objects 


(define (domain inspection014)

    (:requirements :strips :typing :negative-preconditions)

    (:predicates
        (waypoint ?x)           ;true iff x is a waypoint
        (at-waypoint ?x)        ;true iff x is a waypoint and the robot is located at x
        (has-passed ?x)         ;true iff x is a waypoint nad the robot has previously passed x
        (rob-facing ?x)         ;true iff x is a waypoint and the robot is facing x
        (has-inspected ?o)      ;true iff o is an interesting nuclear reactor object and the robot has inspected object
        (is-interesting ?o)     ;true iff o is an interesting nuclear reactor object
        (at-interesting ?x ?o)  ;true iff o is an interesting nuclear reactor object, x is a waypoint, and x is located at o
    )
    
    ;action to turn towards waypoint
    (:action turn
        ;we have a waypoint x and some elements e and f that is either an object or a waypoint .
        :parameters (?x ?e ?f) 
        
        ;the robot is at waypoint x and there is a waypoint or an interesting object
        :precondition   (and    (at-waypoint ?x) 
                                (or (waypoint ?e) (is-interesting ?e)) (or (waypoint ?f) (is-interesting ?f))
                                (rob-facing ?f) (not (rob-facing ?e))
                        ) 
        
        ;the effect is that the robot is facing the object e and no longer the object f
        :effect (and (at-waypoint ?x) (rob-facing ?e) (not (rob-facing ?f)))
        
        ;NEED ATTENTION: HOW DO I MAKE THE ROBOT STOP FACING EVERYTHING ELSE???
    
    )
    
    ;action to move to a certain waypoint
    (:action move
        ;we have two waypoints: x and y.
        :parameters (?x ?y)
        
        ;the robot is at waypoint x and is facing waypoint waypoint y
        :precondition (and (at-waypoint ?x) (rob-facing ?y))
        
        ;effect of move is that robot will be at waypoint waypoint y 
        :effect (and (at-waypoint ?y) (not (at-waypoint ?x)) (has-passed ?x) (has-passed ?y)) ; figure out a better way to do this, each waypoint except the first will be considered passed twice.
    )
    
    ;action to inspect an object
    (:action inspect
        ;we have a waypoint x and an object o
        :parameters (?x ?o)
        
        ;robot is at waypoint x, waypoint x is at the interesting object o, and robot is facing o
        :precondition (and (at-waypoint ?x) (at-interesting ?x ?o) (rob-facing ?o)) 
        
        ;the element goes to having been inspected
        :effect (and (has-inspected ?o))
    )
    
    ;action to sense radiation
    
    
    
)
