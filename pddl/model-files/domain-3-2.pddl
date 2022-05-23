;Model version 2.5. PDDL2.1, incl. numerical fluents.

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



(define (domain inspection32)

    ;Fluents indicates the use of the numeric fragment of PDDL 
    (:requirements :strips :typing :negative-preconditions :adl :fluents :action-costs)

    (:types
        coordinate interesting control - object
        posx posy - coordinate
        vessel pipe wall control-box - interesting
        valve vessel-switch - control
        toggle-vessel regular-vessel - vessel
    )

    ;predicates - truth statements about the current state
    (:predicates
        (at-waypoint ?x - posx ?y - posy)      ;true iff position (x, y) is a waypoint and the robot is located at x
        (is-waypoint ?x - posx ?y - posy)
        (has-passed ?x - posx ?y - posy)              ;true iff (x, y) is a waypoint nad the robot has previously passed x
        (has-inspected ?i - interesting)            ;true iff o is an interesting nuclear reactor object and the robot has inspected object
        (by-interesting ?x - posx ?y - posy ?o - interesting)  ;true iff o is an interesting nuclear reactor object, x is a waypoint, and x is located at o
        (by-control ?x - posx ?y - posy ?c - control)
        (radiation-registered ?c - coordinate) ;tracks if radiation has been registered
        (valve-closed ?v - valve) ;tracks if a valve is closed
        (has-valve ?p - pipe ?v - valve) ;tracks if a valve is connected to a pipe
        (vessel-off ?tv - toggle-vessel)
        (switch-connected ?vs - vessel-switch ?tv - toggle-vessel)
    )
    
    ;functions
    (:functions
        (waypoint ?x - coordinate)   ; Euclidian distance between two waypoints. UPDATE LATER
        (total-cost)
    )
    
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
                                  (+ (* (- (waypoint ?to_x) (waypoint ?from_x))
                                        (- (waypoint ?to_x) (waypoint ?from_x)))
                                     (* (- (waypoint ?to_y) (waypoint ?from_y))
                                        (- (waypoint ?to_y) (waypoint ?from_y))))
                        )
                )
    )
    
    ; ;action to inspect an object
    ; (:action inspect
    ;     ;we have a waypoint x and an object o
    ;     :parameters (?x - posx ?y - posy ?i - interesting)
        
    ;     ;robot is at waypoint x, waypoint x is at the interesting object o
    ;     :precondition (and  (is-waypoint ?x ?y)
    ;                         (at-waypoint ?x ?y) 
    ;                         (by-interesting ?x ?y ?i)) 
        
    ;     ;the element goes to having been inspected
    ;     :effect (and (has-inspected ?i))
    ; )

    (:action switch-on
        :parameters (?x - posx ?y - posy ?vs - vessel-switch ?tv - toggle-vessel)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-control ?x ?y ?vs)
                           (switch-connected ?vs ?tv)
                           (vessel-off ?tv))
        :effect (not (vessel-off ?tv))
    )

    
    (:action switch-off
        :parameters (?x - posx ?y - posy ?vs - vessel-switch ?tv - toggle-vessel)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-control ?x ?y ?vs)
                           (switch-connected ?vs ?tv)
                           (not (vessel-off ?tv)))
        :effect (vessel-off ?tv)
    )

    (:action inspect-toggle-vessel
        :parameters (?x - posx ?y - posy ?tv - toggle-vessel)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?tv)
                           (vessel-off ?tv))
        :effect (has-inspected ?tv)
    )
    

    (:action inspect-wall
        :parameters (?x - posx ?y - posy ?w - wall)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?w))
        :effect (has-inspected ?w)
    )    

    (:action inspect-vessel
        :parameters (?x - posx ?y - posy ?v - regular-vessel)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?v))
        :effect (has-inspected ?v)
    )
    

    (:action read-pressure
        :parameters (?x - posx ?y - posy ?b - control-box)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?b))
        :effect (has-inspected ?b)
    )

    (:action open-valve
        ;we have a valve
        :parameters (?x - posx ?y - posy ?p - pipe ?v - valve)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?p)
                           (has-valve ?p ?v)
                           (valve-closed ?v))
        :effect (not (valve-closed ?v))
    )

    
    (:action close-valve
        ;we have a valve
        :parameters (?x - posx ?y - posy ?p - pipe ?v - valve)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?p)
                           (has-valve ?p ?v)
                           (not (valve-closed ?v)))
        :effect (valve-closed ?v)
    )
    
    ;action to inspect pipes
    (:action inspect-pipes
        ;we have a waypoint x and a pipe p
        :parameters (?x - posx ?y - posy ?p - pipe ?v - valve)

        ;robot is at waypoint x, waypoint x is at the pipe. It is also a condition that the valve has been turned on. 
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y)
                           (by-interesting ?x ?y ?p)
                           (not (valve-closed ?v))
                           (has-valve ?p ?v))

        ;the pipe has been inspected
        :effect (has-inspected ?p)
    )
    
    ;action to register radiation level at waypoint
    (:action register-radiation
        :parameters (?x - posx ?y - posy)
        :precondition (and (is-waypoint ?x ?y)
                           (at-waypoint ?x ?y))
        :effect (and (radiation-registered ?x)
                     (radiation-registered ?y))
    )
    
    ;action to sense radiation
    
    
    
)
