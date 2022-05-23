;Model version 3.1. Inspection with all object types. 
; Objects are arbitrarily defined. 

(define (problem full-inspection)
    (:domain inspection32)
    
    ;Objects
    (:objects   
                pipe1-obj10 pipe2-obj9 pipe3-obj8 pipe4-obj11 pipe5-obj7 - pipe
                valve1 valve2 valve3 valve4 valve5 - valve 
                box1-obj7 - control-box
                vessel1-obj6 vessel2-obj4 vessel3-obj5 vessel4-obj5 vessel6-obj3 vessel7-obj2 - regular-vessel
                wall1-obj14 wall2-obj13 wall3-obj15 wall4-obj12 - wall
                vessel5-obj1 - toggle-vessel
                switch1-obj16 - vessel-switch

                ;waypoints      

                w45x w46x w47x w48x w49x w50x 
                w51x w52x w53x w54x w55x w56x w57x w58x w59x w60x 
                w61x w62x w63x w64x w65x w66x w67x w68x  - posx


                w45y w46y w47y w48y w49y w50y 
                w51y w52y w53y w54y w55y w56y w57y w58y w59y w60y 
                w61y w62y w63y w64y w65y w66y w67y w68y  - posy
    )
    
    ;Initial State
    ;Need to set valve to pipe, set all valves to closed. 
    (:init  ;Specify coordinate values (imported from file in misc):
                
                (= (waypoint w45x) -5.341214179992676) 
                (= (waypoint w46x) -5.238883018493652) 
                (= (waypoint w47x) -6.539395332336426) 
                (= (waypoint w48x) -2.991973876953125) 
                (= (waypoint w49x) -1.1190853118896484) 
                (= (waypoint w50x) -1.2698564529418943) 
                (= (waypoint w51x) -4.3794145584106445) 
                (= (waypoint w52x) 0.7567977905273438) 
                (= (waypoint w53x) 1.90557861328125) 
                (= (waypoint w54x) 1.0633811950683594) 
                (= (waypoint w55x) 2.9364118576049805) 
                (= (waypoint w56x) 6.2021589279174805) 
                (= (waypoint w57x) 7.806118965148926) 
                (= (waypoint w58x) 6.575754165649414) 
                (= (waypoint w59x) 4.857912063598633) 
                (= (waypoint w60x) 7.938353538513184) 
                (= (waypoint w61x) 6.407493591308594) 
                (= (waypoint w62x) 4.336721420288086) 
                (= (waypoint w63x) 7.3481903076171875) 
                (= (waypoint w64x) 6.000916481018066) 
                (= (waypoint w65x) 2.1140708923339844) 
                (= (waypoint w66x) 1.3926963806152344) 
                (= (waypoint w67x) -0.6474685668945312) 
                (= (waypoint w68x) 0.5516986846923828) 

                (= (waypoint w45y) 6.497528553009033) 
                (= (waypoint w46y) 8.137776374816895) 
                (= (waypoint w47y) 4.391872406005859) 
                (= (waypoint w48y) 3.835938453674317) 
                (= (waypoint w49y) 7.366295337677002) 
                (= (waypoint w50y) 8.689624786376953) 
                (= (waypoint w51y) 4.468411445617676) 
                (= (waypoint w52y) 7.501811027526855) 
                (= (waypoint w53y) 8.655957221984863) 
                (= (waypoint w54y) 7.538145065307617) 
                (= (waypoint w55y) 7.717143535614014) 
                (= (waypoint w56y) 8.6217622756958) 
                (= (waypoint w57y) 7.990253448486328) 
                (= (waypoint w58y) 7.106501579284668) 
                (= (waypoint w59y) 6.749738693237305) 
                (= (waypoint w60y) 5.575770378112793) 
                (= (waypoint w61y) 5.127005577087402) 
                (= (waypoint w62y) 3.472482681274414) 
                (= (waypoint w63y) 2.3798952102661133) 
                (= (waypoint w64y) 1.9578466415405276) 
                (= (waypoint w65y) 2.127309799194336) 
                (= (waypoint w66y) 2.1152877807617188) 
                (= (waypoint w67y) 2.2751903533935547) 
                (= (waypoint w68y) 5.317008972167969) 

            ;specify which combination of waypoint coordinates are valid
                
                (is-waypoint w45x w45y) 
                (is-waypoint w46x w46y) 
                (is-waypoint w47x w47y) 
                (is-waypoint w48x w48y) 
                (is-waypoint w49x w49y) 
                (is-waypoint w50x w50y) 
                (is-waypoint w51x w51y) 
                (is-waypoint w52x w52y) 
                (is-waypoint w53x w53y) 
                (is-waypoint w54x w54y) 
                (is-waypoint w55x w55y) 
                (is-waypoint w56x w56y) 
                (is-waypoint w57x w57y) 
                (is-waypoint w58x w58y) 
                (is-waypoint w59x w59y) 
                (is-waypoint w60x w60y) 
                (is-waypoint w61x w61y) 
                (is-waypoint w62x w62y) 
                (is-waypoint w63x w63y) 
                (is-waypoint w64x w64y) 
                (is-waypoint w65x w65y) 
                (is-waypoint w66x w66y) 
                (is-waypoint w67x w67y) 
                (is-waypoint w68x w68y) 

            ;specify where the robot starts
                (at-waypoint w45x w45y)

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