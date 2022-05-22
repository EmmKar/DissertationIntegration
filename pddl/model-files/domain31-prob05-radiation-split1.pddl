;Model version 3.1. Inspection with all object types. 
; Objects are arbitrarily defined. 

(define (problem full-inspection)
    (:domain inspection31)
    
    ;Objects
    (:objects   ;waypoints
                w1x w2x w3x w4x w5x w6x w7x w8x w9x w10x 
                w11x w12x w13x w14x w15x w16x w17x w18x w19x w20x  - posx

                w1y w2y w3y w4y w5y w6y w7y w8y w9y w10y 
                w11y w12y w13y w14y w15y w16y w17y w18y w19y w20y  - posy
    )
    
    ;Initial State
    ;Need to set valve to pipe, set all valves to closed. 
    (:init  ;Specify coordinate values (imported from file in misc):
                (= (waypoint w1x) -0.1218318939208984) 
                (= (waypoint w2x) 1.994096755981445) 
                (= (waypoint w3x) 4.5313568115234375) 
                (= (waypoint w4x) 6.557579040527344) 
                (= (waypoint w5x) 7.842391490936279) 
                (= (waypoint w6x) 6.856735229492188) 
                (= (waypoint w7x) 5.555830001831055) 
                (= (waypoint w8x) 5.42558479309082) 
                (= (waypoint w9x) 6.519083023071289) 
                (= (waypoint w10x) 6.963254928588867) 
                (= (waypoint w11x) 4.584283828735352) 
                (= (waypoint w12x) 2.317379951477051) 
                (= (waypoint w13x) 1.2779722213745115) 
                (= (waypoint w14x) -0.1611576080322265) 
                (= (waypoint w15x) -0.1605119705200195) 
                (= (waypoint w16x) 2.485994338989258) 
                (= (waypoint w17x) 4.404748916625977) 
                (= (waypoint w18x) 5.656575202941895) 
                (= (waypoint w19x) 0.4570999145507812) 
                (= (waypoint w20x) -1.0125885009765625) 
                (= (waypoint w1y) -0.0259771347045898) 
                (= (waypoint w2y) -0.0439786911010742) 
                (= (waypoint w3y) -0.085784912109375) 
                (= (waypoint w4y) -0.3214273452758789) 
                (= (waypoint w5y) -2.5718584060668945) 
                (= (waypoint w6y) -5.310903549194336) 
                (= (waypoint w7y) -3.291231155395508) 
                (= (waypoint w8y) -6.284844398498535) 
                (= (waypoint w9y) -6.657915115356445) 
                (= (waypoint w10y) -8.342772483825684) 
                (= (waypoint w11y) -8.234786033630371) 
                (= (waypoint w12y) -8.385184288024902) 
                (= (waypoint w13y) -8.489228248596191) 
                (= (waypoint w14y) -6.5234785079956055) 
                (= (waypoint w15y) -3.616194725036621) 
                (= (waypoint w16y) -1.8003826141357422) 
                (= (waypoint w17y) -1.3879127502441406) 
                (= (waypoint w18y) -1.8085193634033203) 
                (= (waypoint w19y) -1.4837875366210938) 
                (= (waypoint w20y) 0.2969217300415039) 


            ;specify which combination of waypoint coordinates are valid
                (is-waypoint w1x w1y) 
                (is-waypoint w2x w2y) 
                (is-waypoint w3x w3y) 
                (is-waypoint w4x w4y) 
                (is-waypoint w5x w5y) 
                (is-waypoint w6x w6y) 
                (is-waypoint w7x w7y) 
                (is-waypoint w8x w8y) 
                (is-waypoint w9x w9y) 
                (is-waypoint w10x w10y) 
                (is-waypoint w11x w11y) 
                (is-waypoint w12x w12y) 
                (is-waypoint w13x w13y) 
                (is-waypoint w14x w14y) 
                (is-waypoint w15x w15y) 
                (is-waypoint w16x w16y) 
                (is-waypoint w17x w17y) 
                (is-waypoint w18x w18y) 
                (is-waypoint w19x w19y) 
                (is-waypoint w20x w20y) 

            ;specify where the robot starts
                (at-waypoint w1x w1y)

            ;total cost (total distance traveled) starts as 0
                (= (total-cost) 0)

        ) 
        
        ;goal specification;
        (:goal (and (forall (?x - posx)
                                (radiation-registered ?x))
                        (forall (?y - posy)
                                (radiation-registered ?y))))

        
        (:metric minimize (total-cost))  
)