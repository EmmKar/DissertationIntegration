;Model version 3.1. Inspection with all object types. 
; Objects are arbitrarily defined. 

(define (problem full-inspection)
    (:domain inspection32)
    
    ;Objects
    (:objects   ;interesting objects for inspection
                pipe-obj7 pipe-obj11 pipe-obj9 pipe-obj10 pipe-obj8 - pipe
                valve-obj7 valve-obj11 valve-obj9 valve-obj10 valve-obj8 - valve 
                box-obj7 - control-box
                vessel-obj5 vessel-obj4 vessel-obj42 vessel-obj52 vessel-obj6 
                vessel-obj3 vessel-obj2 vessel-obj22 vessel-obj32 - regular-vessel
                wall-obj14 wall-obj13 wall-obj15 wall-obj12 - wall
                tvessel-obj1 - toggle-vessel
                switch-obj16 - vessel-switch

                ;waypoints
                w1x w2x w3x w4x w5x w6x w7x w8x w9x w10x 
                w11x w12x w13x w14x w15x w16x w17x w18x w19x w20x 
                w21x w22x - posx
                w1y w2y w3y w4y w5y w6y w7y w8y w9y w10y 
                w11y w12y w13y w14y w15y w16y w17y w18y w19y w20y 
                w21y w22y - posy
    )
    
    ;Initial State
    ;Need to set valve to pipe, set all valves to closed. 
    (:init  ;Specify coordinate values (imported from file in misc):
            (= (waypoint w1x) 6.513132095336914) 
            (= (waypoint w2x) 7.61183500289917) 
            (= (waypoint w3x) 2.546211004257202) 
            (= (waypoint w4x) -0.3044536411762237) 
            (= (waypoint w5x) 2.3570947647094727) 
            (= (waypoint w6x) -0.5821393728256226) 
            (= (waypoint w7x) -0.0354486815631389) 
            (= (waypoint w8x) -0.5453185439109802) 
            (= (waypoint w9x) 5.874478340148926) 
            (= (waypoint w10x) 5.855508804321289) 
            (= (waypoint w11x) -3.813283443450928) 
            (= (waypoint w12x) -6.694038391113281) 
            (= (waypoint w13x) -7.608221530914307) 
            (= (waypoint w14x) 0.1759240478277206) 
            (= (waypoint w15x) -3.381991147994995) 
            (= (waypoint w16x) 0.4798393845558166) 
            (= (waypoint w17x) 4.361365795135498) 
            (= (waypoint w18x) 1.5060231685638428) 
            (= (waypoint w19x) -0.6604978442192078) 
            (= (waypoint w20x) -0.5661982893943787) 
            (= (waypoint w21x) 1.4204607009887695)
            (= (waypoint w22x) -0.12183189392089)
            (= (waypoint w1y) -5.48906135559082) 
            (= (waypoint w2y) -2.595266580581665) 
            (= (waypoint w3y) -1.705905199050903) 
            (= (waypoint w4y) -6.4706220626831055) 
            (= (waypoint w5y) -8.124214172363281) 
            (= (waypoint w6y) -3.5115349292755127) 
            (= (waypoint w7y) -5.020480632781982) 
            (= (waypoint w8y) -4.9900994300842285) 
            (= (waypoint w9y) -3.491962432861328) 
            (= (waypoint w10y) -6.34856653213501) 
            (= (waypoint w11y) -7.6300225257873535) 
            (= (waypoint w12y) -5.239445686340332) 
            (= (waypoint w13y) 3.3208255767822266) 
            (= (waypoint w14y) 0.218757078051567) 
            (= (waypoint w15y) 3.801892757415772) 
            (= (waypoint w16y) 7.239800930023193) 
            (= (waypoint w17y) 4.347860813140869) 
            (= (waypoint w18y) 2.0962138175964355) 
            (= (waypoint w19y) 2.0719447135925293) 
            (= (waypoint w20y) 5.032551288604736) 
            (= (waypoint w21y) 5.208882808685303) 
            (= (waypoint w22y) -0.0259771347045)

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
            (is-waypoint w21x w21y) 
            (is-waypoint w22x w22y)

            ;specify where the inspection objects are located
            (by-interesting w1x w1y vessel-obj6)
            (by-interesting w2x w2y box-obj7)
            (by-interesting w2x w2y pipe-obj7)
            (by-interesting w3x w3y vessel-obj5)
            (by-interesting w4x w4y vessel-obj4)
            (by-interesting w5x w5y vessel-obj42)
            (by-interesting w6x w6y vessel-obj52)
            (by-interesting w8x w8y pipe-obj11)
            (by-interesting w9x w9y pipe-obj9)
            (by-interesting w10x w10y pipe-obj10)
            (by-interesting w11x w11y pipe-obj8)
            (by-interesting w12x w12y tvessel-obj1)
            (by-interesting w14x w14y wall-obj14)
            (by-interesting w15x w15y wall-obj13)
            (by-interesting w16x w16y wall-obj15)
            (by-interesting w17x w17y wall-obj12)
            (by-interesting w18x w18y vessel-obj3)
            (by-interesting w19x w19y vessel-obj2)
            (by-interesting w20x w20y vessel-obj22)
            (by-interesting w21x w21y vessel-obj32)

            ;specify where switch is located
            (by-control w13x w13y switch-obj16)
            (switch-connected switch-obj16 tvessel-obj1)

            ;specify which valve belongs to which pip
        ;     pipe1-obj10 pipe2-obj9 pipe3-obj8 pipe4-obj11 pipe5-obj7
            (has-valve pipe-obj10 valve-obj10)  
            (has-valve pipe-obj9 valve-obj9)
            (has-valve pipe-obj8 valve-obj8)
            (has-valve pipe-obj11 valve-obj11)
            (has-valve pipe-obj7 valve-obj7)

            ;valves are closed
            (valve-closed valve-obj10)
            (valve-closed valve-obj9)
            (valve-closed valve-obj8)
            (valve-closed valve-obj11)
            (valve-closed valve-obj7)

            ;specify where the robot starts
            (at-waypoint w22x w22y)

            ;total cost (total distance traveled) starts as 0
            (= (total-cost) 0)

        ) 
        
        ;goal specification;
        (:goal (and (forall (?x - posx)
                                (radiation-registered ?x))
                        (forall (?y - posy)
                                (radiation-registered ?y))
                        (at-waypoint w22x w22y)
                        (forall (?o - interesting)
                                (has-inspected ?o))
                        (forall (?v - valve)
                                (valve-closed ?v))
                        (forall (?v - toggle-vessel)
                                (not (vessel-off ?v)))))        
        (:metric minimize (total-cost))  
)