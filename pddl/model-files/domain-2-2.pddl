;Model version 2.1. PDDL2.1, incl. numerical fluents.

; Author: Emma Karlsmose
; Last edited: 10 May 2022

; Domain to represent waypoints by their coordinates extracted from simulation. 
; Distances between waypoints will be represented as euclidean distance
; The idea is that any problem will try to minimise the total distance traveled, 
; but still visit all waypoints and complete all tasks. 
;
; References:
;   - HASLUM2019pddl - PDDL: An Introduction to the Planning Domain Definition Language 
;       (Pages 31, 27-34, 84, 83-91)



(define (domain inspection22)

    ;Fluents indicates the use of the numeric fragment of PDDL 
    (:requirements :strips :typing :negative-preconditions :adl :fluents :action-costs)

    (:types
        coordinate interesting - object
        posx posy - coordinate ;for readability i will simply use waypoint type where a waypoint is treated
                                ;and this is mainly here to make clear that a waypoint consists of x and y coordinates
                                ;and that they are not the same. This is a bit of misuse of the language.
    )

    ;predicates - truth statements about the current state
    (:predicates
        (at-waypoint ?x - posx ?y - posy)      ;true iff position (x, y) is a waypoint and the robot is located at x
        (is-waypoint ?x - posx ?y - posy)
        (has-passed ?x - posx ?y - posy)              ;true iff (x, y) is a waypoint nad the robot has previously passed x
        ;(rob-facing ?o - object)         ;true iff x is a waypoint and the robot is facing x
        (has-inspected ?i - interesting)            ;true iff o is an interesting nuclear reactor object and the robot has inspected object
        (by-interesting ?x - posx ?y - posy ?o - interesting)  ;true iff o is an interesting nuclear reactor object, x is a waypoint, and x is located at o
    )
    
    ;functions
    (:functions
        (waypoint ?x - coordinate)   ; Euclidian distance between two waypoints. UPDATE LATER
        ;Have something to note radiation. Page 32(52) in pdf
        (total-cost)
    )


    ; ;action to turn towards waypoint
    ; (:action turn
    ;     ;we have a waypoint x and some elements e and f that is either an object or a waypoint .
    ;     :parameters (?w - waypoint ?e - object ?f - object) 
        
    ;     ;the robot is at waypoint x and there is a waypoint or an interesting object
    ;     :precondition (and  (at-waypoint ?w) 
    ;                         (rob-facing ?f) 
    ;                         (not (rob-facing ?e))) 
        
    ;     ;the effect is that the robot is facing the object e and no longer the object f
    ;     :effect (and    (at-waypoint ?w) 
    ;                     (rob-facing ?e) 
    ;                     (not (rob-facing ?f)))
        
    ;     ;NEED ATTENTION: HOW DO I MAKE THE ROBOT STOP FACING EVERYTHING ELSE???
    
    ; )
    
    ;action to move to a certain waypoint
    (:action move
        ;we have two waypoints: x and y.
        :parameters (?from_x - posx ?from_y - posy 
                     ?to_x - posx ?to_y - posy)
        
        ;the robot is at waypoint from and there is a second waypoint 2
        :precondition (and  (at-waypoint ?from_x ?from_y)
                            (is-waypoint ?to_x ?to_y))
        
        ;effect of move is that robot will be at waypoint waypoint y 
        :effect (and    (at-waypoint ?to_x ?to_y) 
                        (not (at-waypoint ?from_x ?from_y)) 
                        (has-passed ?from_x ?from_y) 
                        ;(has-passed ?from) ; figure out a better way to do this, each waypoint except the first will be considered passed twice.
                        ;increases the total cost by the distance between waypoints. Square euclidian distance to avoid distances
                        (increase (total-cost)
                                  (* ( + ( * (waypoint ?from_x) (waypoint ?from_y))
                                         ( * (waypoint ?to_x) (waypoint ?to_y))) 
                                     ( + ( * (waypoint ?from_x) (waypoint ?from_y))
                                         ( * (waypoint ?to_x) (waypoint ?to_y))))) 
                         )
    )
    
    ;action to inspect an object
    (:action inspect
        ;we have a waypoint x and an object o
        :parameters (?x - posx ?y - posy ?i - interesting)
        
        ;robot is at waypoint x, waypoint x is at the interesting object o, and robot is facing o
        :precondition (and  (is-waypoint ?x ?y)
                            (at-waypoint ?x ?y) 
                            (by-interesting ?x ?y ?i)) 
        
        ;the element goes to having been inspected
        :effect (and (has-inspected ?i))
    )
    
    ;action to sense radiation
    
    
    
)

; NOTES:
;   - In the numeric fragment of PDDL all functions are number valued, so the 
;
