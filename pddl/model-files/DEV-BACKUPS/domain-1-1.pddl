; MODEL TO MOVE ROBOT FROM WAYPOINT W1 to WAYPOINT W2
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


(define (domain inspection011)
    (:predicates
        (waypoint ?x)
        (at-waypoint ?x)
        (rob-facing ?x)
    )
    
    (:action turn
        ;we have two waypoints; x and y.
        :parameters (?x ?y) 
        
        ;the robot is at waypoint x and is not facing waypoint y
        :precondition (and (at-waypoint ?x) (waypoint ?y)) ; should i specify the false statement? should I specify that waypoint y exists, or is that handled in the parameters (done)?
        
        ;the effect is that the robot is facing the waypoint dead waypoint
        :effect (and (at-waypoint ?x) (rob-facing ?y))
    
    )

    (:action move
        ;we have two waypoints: x and y.
        :parameters (?x ?y)
        
        ;the robot is at waypoint x and is facing waypoint waypoint y
        :precondition (and (at-waypoint ?x) (rob-facing ?y))
        
        ;effect of move is that robot will be at waypoint waypoint y 
        :effect (and (at-waypoint ?y) (not (at-waypoint ?x)))
    )
)
